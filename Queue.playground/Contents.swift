// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}


var fila = Queue<Int>()

fila.enqueue(1)
print(fila)
fila.enqueue(10)
print(fila)
fila.enqueue(100)
print(fila)
fila.dequeue()
print(fila)


public struct MoreEfficientQueue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        //if array.count > 50 && percentage > 0.25 {
        if head > 5 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

var filaMaisEficiente = MoreEfficientQueue<Int>()

print(filaMaisEficiente)
filaMaisEficiente.enqueue(1)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(2)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(3)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(4)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(5)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(6)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(7)
print(filaMaisEficiente)
filaMaisEficiente.enqueue(8)
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
filaMaisEficiente.dequeue()
print(filaMaisEficiente)
