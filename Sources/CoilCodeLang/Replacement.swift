import Foundation

public struct Replacement {
    public let symbol: Symbol
    public let name: String
    public let affine: Affine?
    public let predicate: Predicate?
}

public enum Symbol {
    case terminal
    case nonterminal
}

public extension Replacement {

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
