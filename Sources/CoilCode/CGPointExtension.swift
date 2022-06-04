import CoreGraphics

extension CGPoint {
    var quadrance: CGFloat { return x * x + y * y }
    var norm: CGFloat { return hypot(x, y) }
    var normalized: CGPoint { return self / norm }
    func rotateBy(angle: CGFloat) -> CGPoint {
        return applying(CGAffineTransform(rotationAngle: angle))
    }
    func dot(_ p: CGPoint) -> CGFloat { return x * p.x + y * p.y }
    func cross(_ p: CGPoint) -> CGFloat { return x * p.y - y * p.x }
    func distance(to p: CGPoint) -> CGFloat { (p - self).norm }
    var heading: CGFloat { return atan2(y, x) }
    func angle(to: CGPoint) -> CGFloat { return CGPoint.angle(from: self, to: to) }
    static func angle(from u: CGPoint, to v: CGPoint) -> CGFloat {
        return (u.cross(v)).sign * acos(u.dot(v) / (u.norm * v.norm))
    }

    init(fromAngle t: CGFloat) { self.init(x: cos(t), y: sin(t)) }
}

extension CGPoint {
    static func + (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x + b.x, y: a.y + b.y) }
    static func - (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x - b.x, y: a.y - b.y) }
    static func * (v: CGPoint, s: CGFloat) -> CGPoint { return CGPoint(x: v.x * s, y: v.y * s) }
    static func * (s: CGFloat, v: CGPoint) -> CGPoint { return CGPoint(x: s * v.x, y: s * v.y) }
    static func * (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x * b.x, y: a.y * b.y) }
    static func / (v: CGPoint, s: CGFloat) -> CGPoint { return CGPoint(x: v.x / s, y: v.y / s) }
    static func / (s: CGFloat, v: CGPoint) -> CGPoint { return CGPoint(x: s / v.x, y: s / v.y) }
    static func / (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x / b.x, y: a.y / b.y) }
    static prefix func - (p: CGPoint) -> CGPoint { return CGPoint(x: -p.x, y: -p.y) }
}
