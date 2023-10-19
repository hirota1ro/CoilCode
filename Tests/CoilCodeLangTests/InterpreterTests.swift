import XCTest
@testable import CoilCodeLang

class InterpreterTests: XCTestCase {

    func testInterpreter() throws {
        let repl = Replacement(symbol: .nonterminal, name: "abc", affine: nil, predicate: nil)
        let rule = Rule(weight: 1, replacements: [repl, repl, repl])
        let shape = Shape(name: "abc", rules: [rule])
        let script = Script(start: "abc", declare: .declare(.SQUARE), shape: shape)
        let interpreter = Interpreter(seed: 0)
        interpreter.depthLimit = 2
        let sprite = try interpreter.interpret(script: script)
        //print("\(DescriptionAsTree(node: sprite))")
        XCTAssertEqual(sprite.children.count, 3)
        XCTAssertEqual(sprite.children[0].children.count, 0)
    }
}
