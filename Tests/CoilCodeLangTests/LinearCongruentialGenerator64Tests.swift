import XCTest
@testable import CoilCodeLang

class LinearCongruentialGenerator64Tests: XCTestCase {

    func testLinearCongruentialGenerator64() throws {
        var gen = LinearCongruentialGenerator64(seed: 0)
        XCTAssertEqual(Int.random(in: 0 ..< 100, using: &gen), 0)
        XCTAssertEqual(Float.random(in: 0 ..< 1, using: &gen), 0.6820785, accuracy: 1e-5)
        XCTAssertEqual(Double.random(in: 0 ..< 1, using: &gen), 0.6612337245875036, accuracy: 1e-5)
    }
}
