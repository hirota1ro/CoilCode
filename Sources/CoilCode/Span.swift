import Foundation

struct RectSpan {
    var minX: CGFloat
    var minY: CGFloat
    var maxX: CGFloat
    var maxY: CGFloat
}

extension RectSpan {

    init() {
        minX = .greatestFiniteMagnitude
        minY = .greatestFiniteMagnitude
        maxX = -.greatestFiniteMagnitude
        maxY = -.greatestFiniteMagnitude
    }

    mutating func update(_ r: CGRect) {
        minX = Swift.min(r.minX, minX)
        minY = Swift.min(r.minY, minY)
        maxX = Swift.max(r.maxX, maxX)
        maxY = Swift.max(r.maxY, maxY)
    }

    // mutating func update(points: [CGPoint]) {
    //     for p in points {
    //         update(point: p)
    //     }
    // }

    // mutating func update(point: CGPoint) {
    //     minX = Swift.min(point.x, minX)
    //     minY = Swift.min(point.y, minY)
    //     maxX = Swift.max(point.x, maxX)
    //     maxY = Swift.max(point.y, maxY)
    // }

    var rect: CGRect {
        return CGRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
