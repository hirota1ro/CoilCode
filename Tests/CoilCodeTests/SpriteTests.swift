import XCTest
@testable import CoilCode
import CGLib

class SpriteTests: XCTestCase {

    func testSpriteBounds() throws {
        let hbar = CGRect(x: -1, y: -0.1, width: 2, height: 0.2)
        let sprite = Sprite(affine: CGAffineTransform(rotationAngle: 30 / 180 * .pi))
        sprite.add(graphics: PathFillGraphics(path: .rect(hbar), color: .black))
        let r = sprite.frame
        XCTAssertEqual(r.minX, -0.9160254037844388, accuracy: 1e-5)
        XCTAssertEqual(r.minY, -0.5866025403784438, accuracy: 1e-5)
        XCTAssertEqual(r.width, 1.8320508075688775, accuracy: 1e-5)
        XCTAssertEqual(r.height, 1.1732050807568877, accuracy: 1e-5)
    }

    func testSprite() throws {
        let square = CGRect(x: -1, y: -1, width: 2, height: 2)
        let parent = Sprite()
        parent.add(graphics: PathFillGraphics(path: .rect(square), color: .black))
        let child = Sprite(affine: CGAffineTransform(translationX: 1, y: 0))
        child.add(graphics: PathFillGraphics(path: .rect(square), color: .black))
        parent.append(child: child)
        let rect = parent.frame
        XCTAssertEqual(rect.minX, -1.0, accuracy: 1e-5)
        XCTAssertEqual(rect.minY, -1.0, accuracy: 1e-5)
        XCTAssertEqual(rect.width, 3.0, accuracy: 1e-5)
        XCTAssertEqual(rect.height, 2.0, accuracy: 1e-5)
    }

    func testSpriteFrame() throws {
        let square = CGRect(x: -1, y: -1, width: 2, height: 2)
        let root = Sprite()
        root.add(graphics: PathFillGraphics(path: .rect(square), color: .black))
        var parent = root
        for _ in 0 ..< 2 {
            let child = Sprite(affine: CGAffineTransform(rotationAngle: 1 / 180 * CGFloat.pi) * CGAffineTransform(scaleX: 0.99, y: 0.99) * CGAffineTransform(translationX:0, y: 0.98))
            child.add(graphics: PathFillGraphics(path: .rect(square), color: .black))
            parent.append(child: child)
            parent = child
        }
        //print("\(DescriptionAsTree(node: root))")
        let rect = root.frame
        XCTAssertEqual(rect.minX, -1.0312373214435737, accuracy: 1e-5)
        XCTAssertEqual(rect.minY, -1.0, accuracy: 1e-5)
        XCTAssertEqual(rect.width, 2.045419176956253, accuracy: 1e-5)
        XCTAssertEqual(rect.height, 3.964357230558852, accuracy: 1e-5)
    }
}
