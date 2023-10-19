import XCTest
@testable import CoilCode
import Sprite

class CoilCodeTests: XCTestCase {

    func testExample() throws {
        let script = Script(start: "tree",
                            declare: .declare(.SQUARE),
                            .shape(name: "tree",
                                   .rule(weight: 1.0,
                                         .path(name: "SQUARE"),
                                         .shape(name: "tree", affine: .rotate(.f(1)) * .scale(.f(0.99)) * .ty(.f(0.98)))
                                   ),
                                   .rule(weight: 0.02,
                                         .shape(name: "tree"),
                                         .shape(name: "tree", affine: .rotate(.f(30)) * .flip(.f(90)))
                                   )
                            )
        )
        let interpreter = Interpreter(seed: 12)
        interpreter.depthLimit = 300
        let sprite = try interpreter.interpret(script: script)
        let raster = Rasterizer(size: CGSize(width: 256, height: 256), backgroundColor: .white)
        guard let image = try raster.image(with: sprite) else { fatalError() }
        guard let data = image.pngData else { fatalError() }
        let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileURL = dir.appendingPathComponent("CoilCodeTests.png")
        try data.write(to: fileURL, options: .atomic)
    }

    func testExample2() throws {
        let line: CGPath = .line(from: CGPoint(x: 0, y: -0.5), to: CGPoint(x: 0, y: 0.5))
        let script = Script(start: "tree",
                            declare: .declare(
                              Path(name: "line", g: { PathStrokeGraphics(path: line, color: $0.cgColor, strokeWidth: $0.strokeWidth) })
                            ),
                            .shape(name: "tree",
                                   .rule(weight: 1.0,
                                         .shape(name: "tree", affine: .ty(.f(0.5)) * .rotate(.f(-30)) * .scale(.f(0.7)) * .ty(.f(0.5))),
                                         .path(name: "line"),
                                         .shape(name: "tree", affine: .ty(.f(0.5)) * .rotate(.f(30)) * .scale(.f(0.7)) * .ty(.f(0.5)))
                                   )
                            )
        )
        let interpreter = Interpreter(seed: UInt64.max)
        interpreter.depthLimit = 100
        interpreter.scaleLimit = 0.001
        let sprite = try interpreter.interpret(script: script)
        let raster = Rasterizer(size: CGSize(width: 256, height: 256), backgroundColor: .white)
        guard let image = try raster.image(with: sprite) else { fatalError() }
        guard let data = image.pngData else { fatalError() }
        let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileURL = dir.appendingPathComponent("CoilCodeTests2.png")
        try data.write(to: fileURL, options: .atomic)
    }

    func testExample3() throws {
        let h: Float = sin(60 / 180 * .pi)
        let h1 = 2 * h / 3
        let h2 = -h / 3
        let script = Script(start: "tri",
                            declare: .declare(.TRIANGLE),
                            .shape(name: "tri",
                                   .rule(weight: 1.0,
                                         .path(name: "TRIANGLE"),
                                         .shape(name: "tri", affine: .rotate(.r(0..<180)) * .scale(.f(0.5)) * .ty(.f(h1)), predicate: .brightness(.f(0.2))),
                                         .shape(name: "tri", affine: .rotate(.r(0..<180)) * .scale(.f(0.5)) * .tx(.f(0.5)) * .ty(.f(h2)), predicate: .brightness(.f(0.2))),
                                         .shape(name: "tri", affine: .rotate(.r(0..<180)) * .scale(.f(0.5)) * .tx(.f(-0.5)) * .ty(.f(h2)), predicate: .brightness(.f(0.2)))
                                   )
                            )
        )
        let interpreter = Interpreter(seed: 12)
        interpreter.depthLimit = 100
        interpreter.scaleLimit = 0.0001
        let sprite = try interpreter.interpret(script: script)
        let raster = Rasterizer(size: CGSize(width: 256, height: 256), backgroundColor: .white)
        guard let image = try raster.image(with: sprite) else { fatalError() }
        guard let data = image.pngData else { fatalError() }
        let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileURL = dir.appendingPathComponent("CoilCodeTests3.png")
        try data.write(to: fileURL, options: .atomic)
    }
}
