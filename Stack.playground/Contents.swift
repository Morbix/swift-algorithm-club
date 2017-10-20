// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Stack

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

var pilha = Stack<Int>()

pilha.push(1)
pilha.push(10)
pilha.push(100)

print(pilha)
