import Foundation

public protocol Graphics {
    var bounds: CGRect { get }
    func draw(context: Context)
}

// MARK: - Path Fill

public struct PathFillGraphics {
    let path: CGPath
    let color: CGColor

    public init(path: CGPath, color: CGColor) {
        self.path = path
        self.color = color
    }
}

extension PathFillGraphics: Graphics {

    public var bounds: CGRect { return path.boundingBox }

    public func draw(context: Context) {
        context.fill(path: path, color: color)
    }
}

// MARK: - Path Stroke

public struct PathStrokeGraphics {
    let path: CGPath
    let color: CGColor
    let strokeWidth: CGFloat

    public init(path: CGPath, color: CGColor, strokeWidth: CGFloat) {
        self.path = path
        self.color = color
        self.strokeWidth = strokeWidth
    }
}

extension PathStrokeGraphics: Graphics {

    public var bounds: CGRect { return path.boundingBox }

    public func draw(context: Context) {
        context.stroke(path: path, color: color, strokeWidth: strokeWidth)
    }
}
