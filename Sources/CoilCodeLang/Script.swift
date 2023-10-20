import Foundation

public struct Script {
    public let start: String
    public let declare: Declare
    public let shapes: [Shape]

    public init(start: String, declare: Declare, shapes: [Shape]) {
        self.start = start
        self.declare = declare
        self.shapes = shapes
    }
}

public extension Script {

    init(start: String, declare: Declare, shape: Shape) {
        self.start = start
        self.declare = declare
        self.shapes = [shape]
    }

    init(start: String, declare: Declare, _ shapes: Shape...) {
        self.start = start
        self.declare = declare
        self.shapes = shapes
    }
}
