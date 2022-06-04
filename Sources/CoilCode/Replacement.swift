import Foundation

struct Replacement {
    let symbol: Symbol
    let name: String
    let affine: Affine?
    let predicate: Predicate?
}

enum Symbol {
    case terminal
    case nonterminal
}

extension Replacement {

    // Path Replacement

    static func path(name: String) -> Replacement {
        return Replacement(symbol: .terminal, name: name, affine: nil, predicate: nil)
    }

    static func path(name: String, affine: Affine) -> Replacement {
        return Replacement(symbol: .terminal, name: name, affine: affine, predicate: nil)
    }

    static func path(name: String, affine: Affine, predicate: Predicate) -> Replacement {
        return Replacement(symbol: .terminal, name: name, affine: affine, predicate: predicate)
    }

    // Shape Replacement

    static func shape(name: String) -> Replacement {
        return Replacement(symbol: .nonterminal, name: name, affine: nil, predicate: nil)
    }

    static func shape(name: String, affine: Affine) -> Replacement {
        return Replacement(symbol: .nonterminal, name: name, affine: affine, predicate: nil)
    }

    static func shape(name: String, affine: Affine, predicate: Predicate) -> Replacement {
        return Replacement(symbol: .nonterminal, name: name, affine: affine, predicate: predicate)
    }
}
