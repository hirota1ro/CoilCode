import Foundation
import CoreGraphics

public struct Color {
    public var components: Components
    public var alpha: Float
}

public extension Color {
    enum Components {
        case RGB(Float, Float, Float)
        case HSB(Float, Float, Float)
    }
}

public extension Color.Components {

    var rgb: Self {
        get {
            switch self {
            case .RGB:
                return self
            case let .HSB(h, s, b):
                let (r, g, b) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                return .RGB(r, g, b)
            }
        }
        set {
            self = newValue
        }
    }

    var hsb: Self {
        get {
            switch self {
            case let .RGB(r, g, b):
                let (h, s, b) = Color.RGBtoHSB(red: r, green: g, blue: b)
                return .HSB(h, s, b)
            case .HSB:
                return self
            }
        }
        set {
            self = newValue
        }
    }

    var red: Float {
        get {
            switch self {
            case let .RGB(r, _, _):
                return r
            case let .HSB(h, s, b):
                let (r, _, _) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                return r
            }
        }
        set {
            switch self {
            case let .RGB(_, g, b):
                self = .RGB(newValue, g, b)
            case let .HSB(h, s, b):
                let (_, g, b) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                self = .RGB(newValue, g, b)
            }
        }
    }

    var green: Float {
        get {
            switch self {
            case let .RGB(_, g, _):
                return g
            case let .HSB(h, s, b):
                let (_, g, _) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                return g
            }
        }
        set {
            switch self {
            case let .RGB(r, _, b):
                self = .RGB(r, newValue, b)
            case let .HSB(h, s, b):
                let (r, _, b) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                self = .RGB(r, newValue, b)
            }
        }
    }

    var blue: Float {
        get {
            switch self {
            case let .RGB(_, _, b):
                return b
            case let .HSB(h, s, b):
                let (_, _, b) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                return b
            }
        }
        set {
            switch self {
            case let .RGB(r, g, _):
                self = .RGB(r, g, newValue)
            case let .HSB(h, s, b):
                let (r, g, _) = Color.HSBtoRGB(hue: h, saturation: s, brightness: b)
                self = .RGB(r, g, newValue)
            }
        }
    }

    var hue: Float {
        get {
            switch self {
            case let .RGB(r, g, b):
                let (h, _, _) = Color.RGBtoHSB(red: r, green: g, blue: b)
                return h
            case let .HSB(h, _, _):
                return h
            }
        }
        set {
            switch self {
            case let .RGB(r, g, b):
                let (_, s, b) = Color.RGBtoHSB(red: r, green: g, blue: b)
                self = .HSB(newValue, s, b)
            case let .HSB(_, s, b):
                self = .HSB(newValue, s, b)
            }
        }
    }

    var saturation: Float {
        get {
            switch self {
            case let .RGB(r, g, b):
                let (_, s, _) = Color.RGBtoHSB(red: r, green: g, blue: b)
                return s
            case let .HSB(_, s, _):
                return s
            }
        }
        set {
            switch self {
            case let .RGB(r, g, b):
                let (h, _, b) = Color.RGBtoHSB(red: r, green: g, blue: b)
                self = .HSB(h, newValue, b)
            case let .HSB(h, _, b):
                self = .HSB(h, newValue, b)
            }
        }
    }

    var brightness: Float {
        get {
            switch self {
            case let .RGB(r, g, b):
                let (_, _, b) = Color.RGBtoHSB(red: r, green: g, blue: b)
                return b
            case let .HSB(_, _, b):
                return b
            }
        }
        set {
            switch self {
            case let .RGB(r, g, b):
                let (h, s, _) = Color.RGBtoHSB(red: r, green: g, blue: b)
                self = .HSB(h, s, newValue)
            case let .HSB(h, s, _):
                self = .HSB(h, s, newValue)
            }
        }
    }

    func equivarent(_ c: Self, accuracy: Float) -> Bool {
        switch self {
        case let .RGB(r1, g1, b1):
            switch c {
            case let .RGB(r2, g2, b2):
                return abs(r1-r2)<accuracy && abs(g1-g2)<accuracy && abs(b1-b2)<accuracy
            case let .HSB(h2, s2, b2):
                let (r2, g2, b2) = Color.HSBtoRGB(hue: h2, saturation: s2, brightness: b2)
                return abs(r1-r2)<accuracy && abs(g1-g2)<accuracy && abs(b1-b2)<accuracy
            }
        case let .HSB(h1, s1, b1):
            switch c {
            case let .RGB(r2, g2, b2):
                let (h2, s2, B2) = Color.RGBtoHSB(red: r2, green: g2, blue: b2)
                return abs(h1-h2)<accuracy && abs(s1-s2)<accuracy && abs(b1-B2)<accuracy
            case let .HSB(h2, s2, b2):
                return abs(h1-h2)<accuracy && abs(s1-s2)<accuracy && abs(b1-b2)<accuracy
            }
        }
    }
}

public extension Color {

    var rbg: Components {
        get { return components.rgb }
        set { components = newValue }
    }

    var hsb: Components {
        get { return components.hsb }
        set { components = newValue }
    }

    var red: Float {
        get { return components.red }
        set { components.red = newValue }
    }

    var green: Float {
        get { return components.green }
        set { components.green = newValue }
    }

    var blue: Float {
        get { return components.blue }
        set { components.blue = newValue }
    }

    var hue: Float {
        get { return components.hue }
        set { components.hue = newValue }
    }

    var saturation: Float {
        get { return components.saturation }
        set { components.saturation = newValue }
    }

    var brightness: Float {
        get { return components.brightness }
        set { components.brightness = newValue }
    }

    var cgColor: CGColor {
        switch components {
        case let .RGB(r, g, b):
            return CGColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
        case let .HSB(h, s, B):
            let (r, g, b) = Color.HSBtoRGB(hue: h, saturation: s, brightness: B)
            return CGColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
        }
    }
}

public extension Color {

    init(red: Float, green: Float, blue: Float, alpha: Float) {
        self.components = Components.RGB(red, green, blue)
        self.alpha = alpha
    }

    init(hue: Float, saturation: Float, brightness: Float, alpha: Float) {
        self.components = Components.HSB(hue, saturation, brightness)
        self.alpha = alpha
    }

    init(gray: Float, alpha: Float) {
        self.components = Components.RGB(gray, gray, gray)
        self.alpha = alpha
    }

    static let black = Color(red: 0, green: 0, blue: 0, alpha: 1)
    static let white = Color(red: 1, green: 1, blue: 1, alpha: 1)
    static let clear = Color(red: 0, green: 0, blue: 0, alpha: 0)
}

extension Color: Equatable {
    static var accuracy: Float = 1e-5

    public static func == (l: Color, r: Color) -> Bool {
        return l.components.equivarent(r.components, accuracy: accuracy) && abs(l.alpha - r.alpha) < accuracy
    }
}

extension Color.Components: CustomStringConvertible {

    public var description: String {
        switch self {
        case let .RGB(r, g, b):
            return "red: \(r), green: \(g), blue: \(b)"
        case let .HSB(h, s, b):
            return "hue: \(h), saturation: \(s), brightness: \(b)"
        }
    }
}

extension Color: CustomStringConvertible {

    public var description: String {
        return "Color(\(components), alpha: \(alpha))"
    }
}

public extension Color {

    static func HSBtoRGB(hue: Float, saturation: Float, brightness: Float) -> (red: Float, green: Float, blue: Float) {
        if saturation == 0 {
            return (red: brightness, green: brightness, blue: brightness)
        }
        let i = Int(6 * hue)
        let f = 6 * hue - Float(i)
        let p = brightness * (1 - saturation)
        let q = brightness * (1 - saturation * f)
        let t = brightness * (1 - saturation * (1 - f))
        switch i {
        case 0, 6: // 6 means hue=1
            return (red: brightness, green: t, blue: p)
        case 1:
            return (red: q, green: brightness, blue: p)
        case 2:
            return (red: p, green: brightness, blue: t)
        case 3:
            return (red: p, green: q, blue: brightness)
        case 4:
            return (red: t, green: p, blue: brightness)
        case 5:
            return (red: brightness, green: p, blue: q)
        default:
            break
        }
        fatalError("impossible")
    }

    static func RGBtoHSB(red: Float, green: Float, blue: Float) -> (hue: Float, saturation: Float, brightness: Float) {
        let min = Swift.min(red, green, blue)
        let max = Swift.max(red, green, blue)
        let brightness = max
        let saturation = (max == 0) ? 0 : (max - min) / max
        var hue: Float = 0
        if saturation > 0 {
            let delta = (max - min) * 6
            if red == max {
                hue = (green - blue) / delta
            } else if green == max {
                hue = 1 / 3 + (blue - red) / delta
            } else {
                hue = 2 / 3 + (red - green) / delta
            }
            if hue < 0 {
                hue += 1
            }
        }
        return (hue: hue, saturation: saturation, brightness: brightness)
    }
}
