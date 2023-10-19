import CoreGraphics

public extension CGFloat {
    var radians: CGFloat { return self * (.pi / 180) }
    var degrees: CGFloat { return self * (180 / .pi) }
    var sign: CGFloat { return self < 0 ? -1 : self > 0 ? 1 : 0 }
}
