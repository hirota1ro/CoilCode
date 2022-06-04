import Foundation

protocol Graphics {
    var bounds: CGRect { get }
    func draw(context: Context)
}

// MARK: - Path Fill

struct PathFillGraphics {
    let path: CGPath
    let color: CGColor
}

extension PathFillGraphics: Graphics {

    var bounds: CGRect { return path.boundingBox }

    func draw(context: Context) {
        context.fill(path: path, color: color)
    }
}

// MARK: - Path Stroke

struct PathStrokeGraphics {
    let path: CGPath
    let color: CGColor
    let strokeWidth: CGFloat
}

extension PathStrokeGraphics: Graphics {

    var bounds: CGRect { return path.boundingBox }

    func draw(context: Context) {
        context.stroke(path: path, color: color, strokeWidth: strokeWidth)
    }
}
