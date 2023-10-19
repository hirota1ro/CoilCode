import XCTest
@testable import Sprite

class SpanTests: XCTestCase {

    func testRectSpan() throws {
        var span = RectSpan()
        span.update(CGRect(x: 1, y: 2, width: 3, height: 4))
        let r = span.rect
        XCTAssertEqual(r.minX, 1, accuracy: 1e-5)
        XCTAssertEqual(r.minY, 2, accuracy: 1e-5)
        XCTAssertEqual(r.width, 3, accuracy: 1e-5)
        XCTAssertEqual(r.height, 4, accuracy: 1e-5)
    }
}
