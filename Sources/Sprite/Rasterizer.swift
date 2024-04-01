import Foundation
import CoreGraphics
import CGLib

public struct Rasterizer {
    let size: CGSize
    let backgroundColor: CGColor?

    public init(size: CGSize, backgroundColor: CGColor? = nil) {
        self.size = size
        self.backgroundColor = backgroundColor
    }
}

public extension Rasterizer {

    func image(with sprite: Sprite) throws -> CGImage? {
        let image = try CGImage.create(size: size) { context in
            if let backgroundColor = backgroundColor {
                context.setFillColor(backgroundColor)
                context.fill(CGRect(origin: .zero, size: size))
            }
            let box = sprite.boundingBox
            let scale = box.size.scaleToFit(size)
            let center = box.center
            context.translateBy(x: size.width / 2, y: size.height / 2)
            context.scaleBy(x: scale, y: scale)
            context.translateBy(x: -center.x, y: -center.y)
            sprite.draw(context: GraphicsContext(cg: context))
        }
        // guard let image = image else { throw InterpreterError.noContext }
        return image
    }
}

extension Sprite {
    var boundingBox: CGRect {
        let box = BoundingBoxContext()
        draw(context: box)
        return box.bounds
    }
}
