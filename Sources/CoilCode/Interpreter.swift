import Foundation
import CGLib
import Sprite

class Interpreter {
    var generator: LinearCongruentialGenerator64

    var shapeMap: [String: Shape] = [:]
    var pathMap: [String: Path] = [:]
    var probMap: [String: Probability] = [:]
    var stack: [Env] = []
    var ctm: CGAffineTransform = .identity

    var scaleLimit: CGFloat = 0.01
    var depthLimit: Int = 10

    init(seed: UInt64) {
        self.generator = LinearCongruentialGenerator64(seed: seed)
    }
}

extension Interpreter {

    struct Env {
        let sprite: Sprite
        let brush: Brush
        let ctm: CGAffineTransform
    }

    func interpret(script: Script) throws -> Sprite {
        guard stack.isEmpty else { throw InterpreterError.bug }
        push(sprite: Sprite(), brush: Brush(thickness: 0.1, color: .black))
        try visit(script: script)
        let top = pop()
        guard stack.isEmpty else { throw InterpreterError.bug }
        return top
    }

    func push(sprite: Sprite, brush: Brush) {
        stack.last?.sprite.append(child: sprite)
        let oldCTM = ctm
        ctm = sprite.affine * oldCTM
        stack.append(Env(sprite: sprite, brush: brush, ctm: oldCTM))
    }

    func pop() -> Sprite {
        let env = stack.removeLast()
        ctm = env.ctm
        return env.sprite
    }

    var sprite: Sprite { return stack.last!.sprite }
    var brush: Brush { return stack.last!.brush }
}

extension Interpreter {

    func visit(script: Script) throws {
        for shape in script.shapes {
            if shapeMap.keys.contains(shape.name) { 
                throw InterpreterError.duplicate(shape.name)
            }
            shapeMap[shape.name] = shape
            probMap[shape.name] = Probability(vector: shape.weightVector)
        }
        for path in script.declare.paths {
            if pathMap.keys.contains(path.name) { 
                throw InterpreterError.duplicate(path.name)
            }
            pathMap[path.name] = path
        }
        guard let shape = shapeMap[script.start] else { throw InterpreterError.noShape(script.start) }
        try visit(shape: shape)
    }

    func visit(shape: Shape) throws {
        guard let shape = shapeMap[shape.name] else { throw InterpreterError.noShape(shape.name) }
        guard let prob = probMap[shape.name] else { throw InterpreterError.noShape(shape.name) }
        let rnd = Int.random(in: 0 ..< prob.count, using: &generator)
        let ind = prob[rnd]
        let rule = shape.rules[ind]
        try visit(rule: rule)
    }

    func visit(rule: Rule) throws {
        for repl in rule.replacements {
            try visit(replacement: repl)
        }
    }

    func visit(replacement: Replacement) throws {
        switch replacement.symbol {
        case .nonterminal: try visit(shapeReplacement: replacement)
        case .terminal: try visit(pathReplacement: replacement)
        }
    }

    func visit(shapeReplacement repl: Replacement) throws {
        guard stack.count < depthLimit else {
            //print("visit:shapeReplacement: count=\(stack.count), det=\(ctm.determinant)")
            return
        }
        guard abs(ctm.determinant) > scaleLimit else {
            //print("visit:shapeReplacement: count=\(stack.count), det=\(ctm.determinant)")
            return
        }
        guard let shape = shapeMap[repl.name] else { throw InterpreterError.noShape(repl.name) }
        let xform = try repl.affine?.cgAffineTransform(mediator: self)
        let child = Sprite(affine: xform ?? .identity)
        let oldBrush = stack.last!.brush
        let newBrush = try repl.predicate?.run(brush: oldBrush, mediator: self) ?? oldBrush
        push(sprite: child, brush: newBrush)
        defer { _ = pop() }
        try visit(shape: shape)
    }

    func visit(pathReplacement repl: Replacement) throws {
        guard let path = pathMap[repl.name] else { throw InterpreterError.noPath(repl.name) }
        let br = try repl.predicate?.run(brush: brush, mediator: self) ?? brush
        if let affine = repl.affine {
            let child = Sprite(affine: try affine.cgAffineTransform(mediator: self))
            child.add(graphics: path.g(br))
            sprite.append(child: child)
        } else {
            sprite.add(graphics: path.g(br))
        }
    }
}

extension Interpreter: ValueMediator {
    func obtain(name: String) throws -> Float {
        throw InterpreterError.noVariable(name)
    }
    func random(in r: Range<Float>) -> Float {
        return Float.random(in: r, using: &generator)
    }
}

enum InterpreterError: Error {
    case notImplementation
    case noShape(String)
    case noPath(String)
    case noVariable(String)
    case duplicate(String)
    case bug
    case noContext
    case noPngData
    case syntax
}
