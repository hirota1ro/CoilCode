import CoreGraphics

public extension CGSize {
    func scaleToFit(_ to: CGSize) -> CGFloat { return Swift.min(to.width / width, to.height / height) }
}

extension CGSize {
    static func + (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width + b.width, height: a.height + b.height) }
    static func - (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width - b.width, height: a.height - b.height) }
    static func * (v: CGSize, s: CGFloat) -> CGSize { return CGSize(width: v.width * s, height: v.height * s) }
    static func * (s: CGFloat, v: CGSize) -> CGSize { return CGSize(width: s * v.width, height: s * v.height) }
    static func * (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width * b.width, height: a.height * b.height) }
    static func / (v: CGSize, s: CGFloat) -> CGSize { return CGSize(width: v.width / s, height: v.height / s) }
    static func / (s: CGFloat, v: CGSize) -> CGSize { return CGSize(width: s / v.width, height: s / v.height) }
    static func / (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width / b.width, height: a.height / b.height) }
}
