import Foundation

struct Rule {
    let weight: Float
    let replacements: [Replacement]
}

extension Rule {

    static func rule(weight: Float, replacement: Replacement) -> Rule {
        return Rule(weight: weight, replacements: [replacement])
    }

    static func rule(weight: Float, _ replacements: Replacement...) -> Rule {
        return Rule(weight: weight, replacements: replacements)
    }
}
