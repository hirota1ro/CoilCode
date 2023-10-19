import Foundation

public struct Rule {
    public let weight: Float
    public let replacements: [Replacement]
}

public extension Rule {

    static func rule(weight: Float, replacement: Replacement) -> Rule {
        return Rule(weight: weight, replacements: [replacement])
    }

    static func rule(weight: Float, _ replacements: Replacement...) -> Rule {
        return Rule(weight: weight, replacements: replacements)
    }
}
