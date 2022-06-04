import XCTest
@testable import CoilCode

class ReplacementTests: XCTestCase {

    func testReplacement() throws {
        let pathrepl: Replacement = .path(name: "abc")
        XCTAssertEqual(pathrepl.symbol, .terminal)
        XCTAssertEqual(pathrepl.name, "abc")
        XCTAssertNil(pathrepl.affine)
        XCTAssertNil(pathrepl.predicate)
        //
        let shaperepl: Replacement = .shape(name: "xyz")
        XCTAssertEqual(shaperepl.symbol, .nonterminal)
        XCTAssertEqual(shaperepl.name, "xyz")
        XCTAssertNil(shaperepl.affine)
        XCTAssertNil(shaperepl.predicate)
    }
}
