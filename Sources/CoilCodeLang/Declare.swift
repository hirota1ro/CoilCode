import Foundation

public struct Declare {
    public let paths: [Path]

    public init(paths: [Path]) {
        self.paths = paths
    }
}

public extension Declare {

    static func declare(path: Path) -> Declare {
        return Declare(paths: [path])
    }

    static func declare(_ paths: Path...) -> Declare {
        return Declare(paths: paths)
    }
}
