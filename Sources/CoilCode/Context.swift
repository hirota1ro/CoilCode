import Foundation
import CGLib

protocol Context {
    var ctm: CGAffineTransform { get }
    func saveGState()
    func restoreGState()
    func concatenate(_ affine: CGAffineTransform)
    func fill(path: CGPath, color: CGColor)
    func stroke(path: CGPath, color: CGColor, strokeWidth: CGFloat)
}

// MARK: - Context on CGContext

struct GraphicsContext {
    let cg: CGContext
}

extension GraphicsContext: Context {

    var ctm: CGAffineTransform { return cg.ctm }
    func saveGState() { cg.saveGState() }
    func restoreGState() { cg.restoreGState() }
    func concatenate(_ affine: CGAffineTransform) { cg.concatenate(affine) }

    func fill(path: CGPath, color: CGColor) {
        cg.beginPath()
        cg.addPath(path)
        cg.setFillColor(color)
        cg.drawPath(using: .fill)
    }

    func stroke(path: CGPath, color: CGColor, strokeWidth: CGFloat) {
        cg.beginPath()
        cg.addPath(path)
        cg.setStrokeColor(color)
        cg.setLineWidth(strokeWidth)
        cg.drawPath(using: .stroke)
    }
}

// MARK: - Context to obtain bounding rect of sprite-tree

class BoundingBoxContext {
    var ctm: CGAffineTransform = .identity
    var stack: [CGAffineTransform] = []
    var rectSpan = RectSpan()
}

extension BoundingBoxContext {
    var bounds: CGRect { return rectSpan.rect }
}

extension BoundingBoxContext: Context {

    func saveGState() { stack.append(ctm) }
    func restoreGState() { ctm = stack.removeLast() }
    func concatenate(_ affine: CGAffineTransform) { ctm = affine * ctm }

    func fill(path: CGPath, color: CGColor) {
        rectSpan.update(path.boundingBox * ctm)
    }

    func stroke(path: CGPath, color: CGColor, strokeWidth: CGFloat) {
        rectSpan.update(path.boundingBox * ctm)
    }
}
