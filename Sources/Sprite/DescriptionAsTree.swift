import Foundation

protocol DescriptionAsTreeNode: CustomStringConvertible {
    func getChildren() -> [DescriptionAsTreeNode]
}

struct DescriptionAsTree {
    let node: DescriptionAsTreeNode
}

extension DescriptionAsTree: CustomStringConvertible {

    var description: String {
        let a = traverse(node: node, indent: [])
        return a.joined(separator: "\n")
    }

    func traverse(node: DescriptionAsTreeNode, indent: [String]) -> [String] {
        var a: [String] = ["\(indent.joined())\(node)"]
        let children = node.getChildren()
        let n = children.count - 1
        for (i, child) in children.enumerated() {
            let s: String = (i < n) ? "├" : "└"
            let b: [String]
            if let last = indent.last {
                let t: String = (last == "├") ? "│" : " "
                b = indent.dropLast(1) + [t, s]
            } else {
                b = indent + [s]
            }
            a += traverse(node: child, indent: b)
        }
        return a
    }
}
