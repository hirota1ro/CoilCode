import Foundation

public struct Brush {
    public var thickness: Float = 0.1
    public var color: Color = .black
}

public extension Brush {

    var strokeWidth: CGFloat { return CGFloat(thickness) }
    var cgColor: CGColor { return color.cgColor }
}
