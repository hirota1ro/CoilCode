import Foundation

struct Declare {
    let paths: [Path]
}

extension Declare {

    static func declare(path: Path) -> Declare {
        return Declare(paths: [path])
    }

    static func declare(_ paths: Path...) -> Declare {
        return Declare(paths: paths)
    }
}
