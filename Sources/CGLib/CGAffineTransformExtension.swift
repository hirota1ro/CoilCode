import CoreGraphics

public extension CGAffineTransform {
    var determinant: CGFloat { return a*d - b*c }
}

public extension CGAffineTransform {
    init(skewX sx: CGFloat, y sy: CGFloat) { self.init(a: 1, b: sy, c: sx, d: 1, tx:0 , ty: 0) }

    static func flip(angle t: CGFloat) -> CGAffineTransform {
        let r⁻¹ = CGAffineTransform(rotationAngle: -t)
        let f = CGAffineTransform(scaleX: 1, y: -1)
        let r = CGAffineTransform(rotationAngle: t)
        return r⁻¹.concatenating(f).concatenating(r)
    }
}

public extension CGAffineTransform {
    static func * (a: CGAffineTransform, b: CGAffineTransform) -> CGAffineTransform { return a.concatenating(b) }
    static func * (p: CGPoint, a: CGAffineTransform) -> CGPoint { return p.applying(a) }
    static func * (r: CGRect, a: CGAffineTransform) -> CGRect { return r.applying(a) }
}
