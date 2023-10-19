import XCTest
@testable import CGLib

class CoreGraphicsExtensionTests: XCTestCase {

    func testCGAffineTransformExtension() throws {
        let rad30 = CGFloat(30).radians
        let rot30 = CGAffineTransform(rotationAngle: -rad30)
        let p30 = CGPoint(x: 0, y: 1) * rot30
        let rad60 = CGFloat(60).radians
        XCTAssertEqual(p30.x, cos(rad60), accuracy: 1e-5)
        XCTAssertEqual(p30.y, sin(rad60), accuracy: 1e-5)
        //
        let flip0 = CGAffineTransform.flip(angle: 0)
        let p1 = CGPoint(x: 1, y: 1) * flip0
        XCTAssertEqual(p1.x, 1, accuracy: 1e-5)
        XCTAssertEqual(p1.y, -1, accuracy: 1e-5)
        //
        let rad90 = CGFloat(90).radians
        let flip90 = CGAffineTransform.flip(angle: rad90)
        XCTAssertEqual(flip90.a, -1, accuracy: 1e-5)
        XCTAssertEqual(flip90.b, 0, accuracy: 1e-5)
        XCTAssertEqual(flip90.c, 0, accuracy: 1e-5)
        XCTAssertEqual(flip90.d, 1, accuracy: 1e-5)
        let p2 = CGPoint(x: 1, y: 1) * flip90
        XCTAssertEqual(p2.x, -1, accuracy: 1e-5)
        XCTAssertEqual(p2.y, 1, accuracy: 1e-5)
    }
}
