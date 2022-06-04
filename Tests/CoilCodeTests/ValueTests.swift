import XCTest
@testable import CoilCode

class ValueTests: XCTestCase {

    func testValue() throws {
        let mediator = TestValueMediator(dict: ["x": 123])

        let v1: Value = .f(456)
        let f1: Float = try v1.resolve(mediator)
        XCTAssertEqual(f1, 456, accuracy: 1e-5)

        let v3: Value = .v("x")
        let f3: Float = try v3.resolve(mediator)
        XCTAssertEqual(f3, 123, accuracy: 1e-5)

        let v2: Value = .r(1..<10)
        let f2: Float = try v2.resolve(mediator)
        XCTAssertEqual(f2, 5.5, accuracy: 1e-5)
    }
}
