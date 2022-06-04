import XCTest
@testable import CoilCode

class BrushTests: XCTestCase {

    func testBrush() throws {
        let br = Brush(thickness: 0.2, color: .white)
        XCTAssertEqual(br.strokeWidth, 0.2, accuracy: 1e-5)
        XCTAssertEqual(br.color, .white)
    }
}
