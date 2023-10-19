import XCTest
@testable import Sprite

class GraphicsTests: XCTestCase {

    func testGraphics() throws {
        let rect = CGRect(x: -1, y: -1, width:2, height: 2)
        let path: CGPath = .rect(rect)
        let g = PathFillGraphics(path: path, color: .black)
        XCTAssertEqual(g.bounds, rect)
    }
}
