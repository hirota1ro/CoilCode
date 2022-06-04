import Foundation

enum Value {
    case f(Float)
    case v(String)
    case r(Range<Float>)
}

protocol ValueMediator {
    func obtain(name: String) throws -> Float
    func random(in r: Range<Float>) -> Float
}

extension Value {

    func resolve(_ mediator: ValueMediator) throws -> Float {
        switch self {
        case let .f(v): return v
        case let .v(n): return try mediator.obtain(name: n)
        case let .r(r): return mediator.random(in: r)
        }
    }
}
