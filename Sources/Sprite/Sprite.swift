import Foundation

public class Sprite {
    public lazy var children: [Sprite] = []
    public lazy var graphics: [Graphics] = []
    public var affine: CGAffineTransform

    public init(affine: CGAffineTransform = .identity) {
        self.affine = affine
    }
}

public extension Sprite {

    var frame: CGRect {
        return bounds.applying(affine)
    }

    var bounds: CGRect {
        var r: CGRect = .null
        r = graphics.reduce(r) { $0.union($1.bounds) }
        r = children.reduce(r) { $0.union($1.frame) }
        return r
    }

    func draw(context: Context) {
        context.saveGState()
        defer { context.restoreGState() }
        context.concatenate(affine)
        for g in graphics {
            g.draw(context: context)
        }
        for child in children {
            child.draw(context: context)
        }
    }
}

public extension Sprite {

    func append(child: Sprite) {
        children.append(child)
    }

    func remove(child: Sprite) {
        children.removeAll { $0 === child }
    }

    func add(graphics g: Graphics) {
        graphics.append(g)
    }

    func clear() {
        graphics.removeAll()
    }
}

extension Sprite: DescriptionAsTreeNode {
    func getChildren() -> [DescriptionAsTreeNode] { return children }
    public var description: String {
        return "<Sprite A=\(affine) B=\(bounds)>"
    }
}
