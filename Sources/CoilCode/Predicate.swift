import Foundation

enum Predicate {
    case hue(Value)
    case saturation(Value)
    case brightness(Value)
    case red(Value)
    case green(Value)
    case blue(Value)
    case alpha(Value)
    indirect case concat(Predicate, Predicate)
}

extension Predicate {
    static func * (l: Predicate, r: Predicate) -> Predicate {
        return .concat(l, r)
    }
}

extension Predicate {

    func run(brush oldBrush: Brush, mediator: ValueMediator) throws -> Brush {
        var brush = oldBrush
        switch self {
        case let .hue(f):
            let ff = try f.resolve(mediator)
            brush.color.hue = brush.color.hue.fluctuation(ff)
        case let .saturation(f):
            let ff = try f.resolve(mediator)
            brush.color.saturation = brush.color.saturation.fluctuation(ff)
        case let .brightness(f):
            let ff = try f.resolve(mediator)
            brush.color.brightness = oldBrush.color.brightness.fluctuation(ff)
        case let .red(f):
            let ff = try f.resolve(mediator)
            brush.color.red = brush.color.red.fluctuation(ff)
        case let .green(f):
            let ff = try f.resolve(mediator)
            brush.color.green = brush.color.green.fluctuation(ff)
        case let .blue(f):
            let ff = try f.resolve(mediator)
            brush.color.blue = brush.color.blue.fluctuation(ff)
        case let .alpha(f):
            let ff = try f.resolve(mediator)
            brush.color.alpha = brush.color.alpha.fluctuation(ff)
        case let .concat(l, r):
            return try r.run(brush: try l.run(brush: brush, mediator: mediator), mediator: mediator)
        }
        return brush
    }
}

extension Float {

    /// increase/decrease value toword [0,1]
    /// - Parameter factor: [-1,1] (+) increase (toward 1), (-) decrease (toward 0).
    /// - Returns: increased/decreased value
    func fluctuation(_ factor: Float) -> Float {
        if factor > 0 {
            return self + (1 - self) * factor
        } else {
            return self + self * factor
        }
    }
}
