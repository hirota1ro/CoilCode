import Foundation

struct Probability {
    let table: [Int]

    init(vector: [Float]) {
        table = Probability.build(with: vector)
    }

    init(count: Int) {
        table = Probability.build(by: count)
    }
}

extension Probability {
    var count: Int { return table.count }
    subscript(_ i: Int) -> Int { return table[i] }
}

extension Probability {

    static func build(with vector: [Float]) -> [Int] {
        let total: Float = vector.reduce(0, +)
        let normalized: [Float] = vector.map { $0 / total }
        let percent: [Int] = normalized.map { Int($0 * 100) }
        let fragments = percent.enumerated().map { Array<Int>(repeating: $0.0, count: $0.1) }
        return fragments.flatMap { $0 }
    }

    static func build(by count: Int) -> [Int] {
        return (0 ..< count).map { $0 }
    }
}
