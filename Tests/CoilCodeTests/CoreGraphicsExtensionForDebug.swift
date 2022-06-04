import CoreGraphics

// MARK: - CustomStringConvertible

extension CGFloat {
    var f2: String { return String(format: "%.2f", self) }
}

extension CGPoint: CustomStringConvertible {
    public var description: String { return "(\(x.f2), \(y.f2))" }
}

extension CGSize: CustomStringConvertible {
    public var description: String { return "(\(width.f2), \(height.f2))" }
}

extension CGRect: CustomStringConvertible {
    public var description: String { return "[x:\(minX.f2), y:\(minY.f2), w:\(width.f2), h:\(height.f2)]" }
}

extension CGAffineTransform: CustomStringConvertible {
    public var description: String { return "[a:\(a.f2), b:\(b.f2), c:\(c.f2), d:\(d.f2), tx:\(tx.f2), ty:\(ty.f2)]" }
}
