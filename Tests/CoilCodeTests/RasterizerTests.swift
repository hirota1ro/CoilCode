import XCTest
@testable import CoilCode

class RasterizerTests: XCTestCase {

    func testRasterizer() throws {
        let size = CGSize(width: 256, height: 256)
        let sprite = Sprite()
        let bp: CGPath = .circle(center: CGPoint(x: size.width/2, y: size.height/2), radius: size.width/2)
        sprite.add(graphics: PathFillGraphics(path: .rect(CGRect(origin: .zero, size: size)), color: .white))
        sprite.add(graphics: PathStrokeGraphics(path: bp, color: .black, strokeWidth: 1))
        //
        let raster = Rasterizer(size: size)
        let image = try raster.image(with: sprite)
        guard let data = image.pngData else { throw InterpreterError.noPngData }
        let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileURL = dir.appendingPathComponent("RasterizerTests.png")
        try data.write(to: fileURL, options: .atomic)
    }
}
