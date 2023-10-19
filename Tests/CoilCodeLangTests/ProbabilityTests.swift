import XCTest
@testable import CoilCodeLang

class ProbabilityTests: XCTestCase {

    func testProbability() throws {
        let p = Probability(vector: [4, 3, 2, 1])
        var histgram: [Int] = [0, 0, 0, 0]
        for i in 0 ..< p.count {
            histgram[p[i]] += 1
        }
        let total = histgram.reduce(0, +)
        XCTAssertEqual(Float(histgram[0]) / Float(total), 0.4, accuracy: 1e-5)
        XCTAssertEqual(Float(histgram[1]) / Float(total), 0.3, accuracy: 1e-5)
        XCTAssertEqual(Float(histgram[2]) / Float(total), 0.2, accuracy: 1e-5)
        XCTAssertEqual(Float(histgram[3]) / Float(total), 0.1, accuracy: 1e-5)
    }
}
