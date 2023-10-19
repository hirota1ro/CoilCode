import XCTest
@testable import CoilCodeLang

class PredicateTests: XCTestCase {

    func testPredicate() throws {
        let mediator = TestValueMediator()

        let p1: Predicate = .red(.f(0.1))
        let oldBr = Brush(thickness: 0.1, color: .black)
        let newBr = try p1.run(brush: oldBr, mediator: mediator)
        XCTAssertEqual(newBr.color.red, 0.1, accuracy: 1e-9)
    }
}
