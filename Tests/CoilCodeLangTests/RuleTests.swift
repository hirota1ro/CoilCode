import XCTest
@testable import CoilCodeLang

class RuleTests: XCTestCase {

    func testRule() throws {
        let r1: Rule = .rule(weight: 1.0, replacement: .shape(name: "abc"))
        XCTAssertEqual(r1.weight, 1.0, accuracy: 1e-5)
        XCTAssertEqual(r1.replacements.count, 1)
    }
}
