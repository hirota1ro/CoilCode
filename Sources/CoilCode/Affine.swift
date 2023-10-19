import Foundation
import CGLib

enum Affine {
    case matrix(Value, Value, Value, Value, Value, Value)
    case rotate(Value)
    case scale(Value)
    case sx(Value)
    case sy(Value)
    case translate(Value, Value)
    case tx(Value)
    case ty(Value)
    case skew(Value, Value)
    case flip(Value)
    indirect case concat(Affine, Affine)
}

extension Affine {

    func cgAffineTransform(mediator: ValueMediator) throws -> CGAffineTransform {
        switch self {
        case let .matrix(a,b,c,d,x,y):
            let aa = CGFloat(try a.resolve(mediator))
            let bb = CGFloat(try b.resolve(mediator))
            let cc = CGFloat(try c.resolve(mediator))
            let dd = CGFloat(try d.resolve(mediator))
            let xx = CGFloat(try x.resolve(mediator))
            let yy = CGFloat(try y.resolve(mediator))
            return CGAffineTransform(a: aa, b: bb, c: cc, d: dd, tx: xx, ty: yy)
        case let .rotate(degree):
            let aa = CGFloat(try degree.resolve(mediator))
            return CGAffineTransform(rotationAngle: aa.radians)
        case let .scale(factor):
            let ff = CGFloat(try factor.resolve(mediator))
            return CGAffineTransform(scaleX: ff, y: ff)
        case let .sx(x):
            let xx = CGFloat(try x.resolve(mediator))
            return CGAffineTransform(scaleX: xx, y: 1)
        case let .sy(y):
            let yy = CGFloat(try y.resolve(mediator))
            return CGAffineTransform(scaleX: 1, y: yy)
        case let .translate(x, y):
            let xx = CGFloat(try x.resolve(mediator))
            let yy = CGFloat(try y.resolve(mediator))
            return CGAffineTransform(translationX: xx, y: yy)
        case let .tx(x):
            let xx = CGFloat(try x.resolve(mediator))
            return CGAffineTransform(translationX: xx, y: 0)
        case let .ty(y):
            let yy = CGFloat(try y.resolve(mediator))
            return CGAffineTransform(translationX: 0, y: yy)
        case let .skew(x, y):
            let xx = CGFloat(try x.resolve(mediator))
            let yy = CGFloat(try y.resolve(mediator))
            return CGAffineTransform(skewX: xx, y: yy)
        case let .flip(degree):
            let aa = CGFloat(try degree.resolve(mediator))
            return CGAffineTransform.flip(angle: aa.radians)
        case let .concat(l, r):
            let ll = try l.cgAffineTransform(mediator: mediator)
            let rr = try r.cgAffineTransform(mediator: mediator)
            return ll.concatenating(rr)
        }
    }
}

extension Affine {

    static func * (l: Affine, r: Affine) -> Affine {
        return .concat(l, r)
    }
}
