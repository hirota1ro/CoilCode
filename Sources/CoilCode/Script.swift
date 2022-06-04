import Foundation

struct Script {
    let start: String
    let declare: Declare
    let shapes: [Shape]
}

extension Script {

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
