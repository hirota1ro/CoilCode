import Foundation

public struct Shape {
    public let name: String
    public let rules: [Rule]
}

public extension Shape {

    static func shape(name: String, rule: Rule) -> Shape {
        return Shape(name: name, rules: [rule])
    }

    static func shape(name: String, _ rules: Rule...) -> Shape {
        return Shape(name: name, rules: rules)
    }
}

public extension Shape {

    var weightVector: [Float] {
        return rules.map { $0.weight }
    }
}
