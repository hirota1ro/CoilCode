import Foundation

extension CGPath {

    static func rect(_ rect: CGRect) -> CGPath {
        return CGPath(rect: rect, transform: nil)
    }

    static func circle(center c: CGPoint, radius r: CGFloat) -> CGPath {
        return CGPath(ellipseIn: CGRect(x: c.x - r, y: c.y - r, width: 2*r, height: 2*r), transform: nil)
    }

    static func line(from: CGPoint, to: CGPoint) -> CGPath {
        let path = CGMutablePath()
        path.move(to: from, transform: .identity)
        path.addLine(to: to, transform: .identity)
        return path
    }

    static func polyline(points: [CGPoint]) -> CGPath {
        return points.reduce(CGMutablePath()) {
            if $0.isEmpty {
                $0.move(to: $1, transform: .identity)
            } else {
                $0.addLine(to: $1, transform: .identity)
            }
            return $0
        }
    }

    static func polygon(points: [CGPoint]) -> CGPath {
        let path = polyline(points: points) as! CGMutablePath
        path.closeSubpath()
        return path
    }

    static func path(_ segments: Segment...) -> CGPath {
        return segments.reduce(CGMutablePath()) {
            $1.build(path: $0)
            return $0
        }
    }

    static func regularPolygon(_ n: Int, center c: CGPoint, radius r: CGFloat) -> CGPath {
        let base = CGFloat(90).radians
        let delta = 2 * .pi / CGFloat(n)
        let points = (0 ..< n).map { c + r * CGPoint(fromAngle: CGFloat($0) * delta + base) }
        return polygon(points: points)
    }
}

extension CGPath {
    enum Segment {
        case M(to: CGPoint)
        case L(to: CGPoint)
        case Q(control: CGPoint, to: CGPoint)
        case C(control1: CGPoint, control2: CGPoint, to: CGPoint)
        case Z
    }
}

extension CGPath.Segment {

    func build(path: CGMutablePath) {
        switch self {
        case let .M(p): path.move(to: p, transform: .identity)
        case let .L(p): path.addLine(to: p, transform: .identity)
        case let .Q(c, p): path.addQuadCurve(to: p, control: c, transform: .identity)
        case let .C(c, d, p): path.addCurve(to: p, control1: c, control2: d, transform: .identity)
        case .Z: path.closeSubpath()
        }
    }
}
