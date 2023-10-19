import XCTest
@testable import CoilCode
import CGLib

class AffineTests: XCTestCase {

    func testAffine() throws {
        let mediator = TestValueMediator()
        //
        let a1: Affine = .rotate(.f(90)) * .tx(.f(100))
        let t1 = try a1.cgAffineTransform(mediator: mediator)
        let p1 = CGPoint(x: 1, y: 0) * t1
        XCTAssertEqual(p1.x, 100, accuracy: 1e-5)
        XCTAssertEqual(p1.y, 1, accuracy: 1e-5)
        //
        let a2: Affine = .tx(.f(100)) * .rotate(.f(90))
        let t2 = try a2.cgAffineTransform(mediator: mediator)
        let p2 = CGPoint(x: 1, y: 0) * t2
        XCTAssertEqual(p2.x, 0, accuracy: 1e-5)
        XCTAssertEqual(p2.y, 101, accuracy: 1e-5)
    }
}
