import XCTest
@testable import CoilCode

class DeclareTests: XCTestCase {

    func testDeclare() throws {
        let path: Path = .CIRCLE
        let declare = Declare(paths: [path])
        XCTAssertEqual(declare.paths.count, 1)
        XCTAssertEqual(declare.paths[0].name, "CIRCLE")
    }
}
