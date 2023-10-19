import XCTest
@testable import CoilCodeLang

class ColorTests: XCTestCase {

    func testColor() throws {
        let c1 = Color(hue: 0, saturation: 1, brightness: 1, alpha: 1)
        XCTAssertEqual(c1.red, 1, accuracy: 1e-5)
        XCTAssertEqual(c1.green, 0, accuracy: 1e-5)
        XCTAssertEqual(c1.blue, 0, accuracy: 1e-5)

        let color = Color(gray: 1, alpha: 1).cgColor
        XCTAssertEqual(color.numberOfComponents, 4)
        let components: [CGFloat] = color.components!
        XCTAssertEqual(components[0], 1, accuracy: 1e-5)
        XCTAssertEqual(components[1], 1, accuracy: 1e-5)
        XCTAssertEqual(components[2], 1, accuracy: 1e-5)
        XCTAssertEqual(components[3], 1, accuracy: 1e-5)
    }
}
