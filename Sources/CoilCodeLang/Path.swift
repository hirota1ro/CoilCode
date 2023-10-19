import Foundation
import Sprite

public struct Path {
    public let name: String
    public let g: (Brush) -> Graphics

    public init(name: String, g: @escaping (Brush) -> Graphics) {
        self.name = name
        self.g = g
    }
}

public extension Path {

    static let SQUARE = Path(name: "SQUARE", g: square)
    static func square(brush: Brush) -> Graphics {
        return PathFillGraphics(path: .rect(CGRect(x: -0.5, y: -0.5, width: 1, height: 1)), color: brush.cgColor)
    }

    static let CIRCLE = Path(name: "CIRCLE", g: circle)
    static func circle(brush: Brush) -> Graphics {
        return PathFillGraphics(path: .circle(center: .zero, radius: 0.5), color: brush.cgColor)
    }

    static let TRIANGLE = Path(name: "TRIANGLE", g: triangle)
    static func triangle(brush: Brush) -> Graphics {  
        return PathFillGraphics(path: .regularPolygon(3, center: .zero, radius: 1/(2*cos(CGFloat(30).radians))), color: brush.cgColor)
    }
}
