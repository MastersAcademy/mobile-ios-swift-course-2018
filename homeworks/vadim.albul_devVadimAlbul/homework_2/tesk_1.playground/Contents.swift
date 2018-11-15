import UIKit

class Note<T>: CustomStringConvertible {
    var next: Note?
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var description: String {
        return "\(value)"
    }
}

protocol LinkedList {
    associatedtype ItemType
    var head: Note<ItemType>? { get }
    
    func append(_ item: ItemType)
    func deleteLast()
    func getValue(index: Int) throws -> ItemType
}


extension LinkedList {
    func last() -> Note<ItemType>? {
        var current = head

        while current?.next != nil {
            current = current?.next
        }
        return current
    }

    var count: Int {
        var countItems: Int = 0
        var current = head
        while current != nil {
            countItems += 1
            current = current?.next
        }
        return countItems
    }
    
    var isEmpty: Bool {
        return count == 0
    }
}


enum LinkError: Error {
    case notFound
}

extension LinkError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .notFound: return "* Error: Not found item in list. Please check this and try again."
        }
    }
}


class SinglyLinkedList<T>: LinkedList, CustomStringConvertible {
    typealias ItemType = T
    var head: Note<T>?
    
    func append(_ item: T) {
        guard head != nil else {
            head = Note(value: item)
            return
        }
        let lastItem = self.last()
        lastItem?.next = Note(value: item)
    }
    
    func deleteLast() {
        var current = head
        var before = head
        while current?.next != nil {
            before = current
            current = current?.next
        }
        before?.next = nil
    }
    
    var description: String {
        var arr = [Note<T>?]()
        var current = head
        while current != nil {
            arr.append(current)
            current = current?.next
        }
        return arr.compactMap({$0?.description}).joined(separator: " --> ")
    }
    
    
    func getValue(index: Int) throws -> ItemType {
        var currentIndex: Int = 0
        var current = head
        
        var isStop: Bool = current == nil
        while !isStop {
            if currentIndex == index {
                isStop = true
            } else {
                currentIndex += 1
                current = current?.next
                isStop = current == nil
            }
        }
        
        if let value = current?.value {
            return value
        }
        throw LinkError.notFound
    }
}

var list = SinglyLinkedList<String>()
list.append("Test 1")
list.append("Test 2")
list.append("Test 3")

print(list)
if let item = list.head?.next {
  print(item)
}
list.deleteLast()
print(list)

print(try list.getValue(index: 1))
print(try list.getValue(index: 3))
