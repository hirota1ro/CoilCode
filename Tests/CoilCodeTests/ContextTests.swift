import XCTest
@testable import CoilCode

class ContextTests: XCTestCase {

    func testContext() throws {
        let box = BoundingBoxContext()
        let rect = CGRect(x: -1, y: -1, width: 2, height: 2)
        let path: CGPath = .rect(rect)
        box.fill(path: path, color: .black)
        XCTAssertEqual(box.bounds, rect)
    }
}
