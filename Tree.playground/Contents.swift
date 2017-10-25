// https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure

class Node {
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += "{" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        
        return text
    }
}


let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)
