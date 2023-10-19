import Foundation

public struct Script {
    public let start: String
    public let declare: Declare
    public let shapes: [Shape]

    public init(start: String, declare: Declare, shape: Shape) {
        self.start = start
        self.declare = declare
        self.shapes = [shape]
    }

    public init(start: String, declare: Declare, _ shapes: Shape...) {
        self.start = start
        self.declare = declare
        self.shapes = shapes
    }
}
