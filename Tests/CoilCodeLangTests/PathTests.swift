import XCTest
@testable import CoilCodeLang

class PathTests: XCTestCase {

    func testPath() throws {
        let p1: Path = .SQUARE
        XCTAssertEqual(p1.name, "SQUARE")
        let br = Brush(thickness: 0.1, color: .black)
        let g = p1.g(br)
        XCTAssertEqual(g.bounds, CGRect(x: -0.5, y: -0.5, width: 1, height: 1))
    }
}
