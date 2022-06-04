import Foundation

struct Shape {
    let name: String
    let rules: [Rule]
}

extension Shape {

    static func shape(name: String, rule: Rule) -> Shape {
        return Shape(name: name, rules: [rule])
    }

    static func shape(name: String, _ rules: Rule...) -> Shape {
        return Shape(name: name, rules: rules)
    }
}

extension Shape {

    var weightVector: [Float] {
        return rules.map { $0.weight }
    }
}
