import XCTest
@testable import CGLib

class CGFloatExtensionTests: XCTestCase {

    func testCGFloatExtension() throws {        
        XCTAssertEqual(CGFloat(90).radians, 90 / 180 * CGFloat.pi, accuracy: 1e-5)
        XCTAssertEqual((90 / 180 * CGFloat.pi).degrees, 90, accuracy: 1e-5)
    }
}
