import Foundation

struct Brush {
    var thickness: Float = 0.1
    var color: Color = .black
}

extension Brush {

    var strokeWidth: CGFloat { return CGFloat(thickness) }
    var cgColor: CGColor { return color.cgColor }
}
