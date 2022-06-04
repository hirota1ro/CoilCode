import XCTest
@testable import CoilCode

struct TestValueMediator {
    let dict: [String: Float]
}

extension TestValueMediator {
    init() {
        dict = [:]
    }
}

extension TestValueMediator: ValueMediator {

    func obtain(name: String) throws -> Float {
        guard let value = dict[name] else { throw InterpreterError.noVariable(name) }
        return value
    }

    func random(in r: Range<Float>) -> Float {
        return (r.lowerBound + r.upperBound) / 2
    }
}
