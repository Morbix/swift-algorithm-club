// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Ordered%20Array

// An ordered array is useful for when you want your data to be sorted and you're inserting new items relatively rarely. In that case, it's faster than sorting the entire array. However, if you need to change the array often, it's probably faster to use a regular array and sort it manually.

struct OrderedArray<T: Comparable> {
    fileprivate var array = [T]()
    
    init(array: [T]) {
        self.array = array.sorted()
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    subscript(index: Int) -> T {
        return array[index]
    }
    
    mutating func removeAtIndex(index: Int) -> T {
        return array.remove(at: index)
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
}

extension OrderedArray: CustomStringConvertible {
    var description: String {
        return array.description
    }
}

extension OrderedArray {
    mutating func insert(_ newElement: T) -> Int {
        let i = findInsertionPoint(newElement)
        array.insert(newElement, at: i)
        return i
    }
    
    private func findInsertionPoint(_ newElement: T) -> Int {
        var startIndex = 0
        var endIndex = array.count
        
        while startIndex < endIndex {
            let midIndex = startIndex + (endIndex - startIndex) / 2
            if array[midIndex] == newElement {
                return midIndex
            } else if array[midIndex] < newElement {
                startIndex = midIndex + 1
            } else {
                endIndex = midIndex
            }
        }
        
        return startIndex
    }
}

var array = OrderedArray(array: [1, 30, 24, 12, 21, 15, 17, 11])
array.insert(23)
array
