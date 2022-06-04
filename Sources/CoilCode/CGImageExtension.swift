import Cocoa

extension CGImage {

    var pngData: Data? {
        let bitmapRep = NSBitmapImageRep(cgImage: self)
        guard let data = bitmapRep.representation(using: .png, properties: [:]) else {
            print("no data")
            return nil
        }
        return data
    }

    var jpegData: Data? {
        let bitmapRep = NSBitmapImageRep(cgImage: self)
        guard let data = bitmapRep.representation(using: .jpeg, properties: [:]) else {
            print("no data")
            return nil
        }
        return data
    }
}

extension CGImage {

    static func create(size: CGSize, _ callback: (CGContext) -> Void) throws -> CGImage? {
        let bytesPerPixel: Int = 4
        let bitsPerComponent: Int = 8
        let width: Int = Int(ceil(size.width))
        let height: Int = Int(ceil(size.height))
        let bytesPerRow: Int = bytesPerPixel * width
        let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)!
        var data = Data(count: height * bytesPerRow)
        return try data.withUnsafeMutableBytes {(rawPtr) throws -> CGImage? in
            guard let context = CGContext(data: rawPtr.baseAddress,
                                          width: width,
                                          height: height,
                                          bitsPerComponent: bitsPerComponent,
                                          bytesPerRow: bytesPerRow,
                                          space: colorSpace,
                                          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { return nil }
            callback(context)
            return context.makeImage()
        }
    }
}
