import UIKit

// protocol for element in linked list
protocol ItemLinking {
    var next: Self? { get set }
}

// class for element in list
final class Note<T>: ItemLinking, CustomStringConvertible {
    var next: Note?
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var description: String {
        return "\(value)"
    }
}

// protocol for singly linked list
protocol LinkedListing {
    associatedtype ValueType
    associatedtype NoteType where NoteType: ItemLinking
    var head: NoteType? { get }
    
    func append(_ value: ValueType)
    func deleteLast() throws -> ValueType
    func getValue(index: Int) throws -> ValueType
}

extension LinkedListing {
    func last() -> NoteType? {
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
    
    func getElement(by index: Int) -> NoteType? {
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
        return current
    }
}

// enum LinkError
enum LinkError: Error {
    case notFound
    case notExistItem
    case listIsEmpty
}

extension LinkError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .notFound: return "Not found value in list. Please check this and try again."
        case .notExistItem: return "Not exist item by index in list. Please check this and try again."
        case .listIsEmpty: return "Linked list is Empty."
        }
    }
}

// class for singly linked list
class SinglyLinkedList<T>: LinkedListing, CustomStringConvertible {
    typealias ValueType = T
    var head: Note<T>?
    
    init(_ value: ValueType? = nil) {
        if let value = value {
            self.head = Note(value: value)
        }
    }
    
    func append(_ value: ValueType) {
        guard head != nil else {
            head = Note(value: value)
            return
        }
        let lastItem = self.last()
        lastItem?.next = Note(value: value)
    }
    
    @discardableResult
    func deleteLast() throws -> ValueType {
        guard let head = head else {
            throw LinkError.listIsEmpty
        }
    
        if head.next == nil {
            self.head = nil
            return head.value
        }
        
        var current = head
        var before = head
        while let next = current.next {
            before = current
            current = next
        }
        before.next = nil
        return current.value
    }
    
    func getValue(index: Int) throws -> ValueType {
        if let value = getElement(by: index)?.value {
            return value
        }
        throw LinkError.notFound
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
}

var list = SinglyLinkedList("Test 0")
list.append("Test 1")
list.append("Test 2")
list.append("Test 3")

print("----- Singly Linked List -----")
print(list)
if let item = list.head?.next {
  print(item)
}

do {
    print("Delete: ", try list.deleteLast())
    print(list)
} catch {
    print("** Delete error: \(error)")
}

do {
    print(try list.getValue(index: 1))
    print(try list.getValue(index: 3))
} catch {
    print("** Error: \(error)")
}

// protocol for element in doubly linked list
protocol DoublyItemLinking: ItemLinking {
    var previous: Self? { get set }
}

// class for element in doubly linked list
final class DoublyNote<T>: DoublyItemLinking, CustomStringConvertible {
    var previous: DoublyNote?
    var next: DoublyNote?
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var description: String {
        return "\(value)"
    }
}

// protocol for doubly linked listing
protocol DoublyLinkedListing: LinkedListing {
    func insertFirst(_ value: ValueType)
    func insert(value: ValueType, at index: Int) throws
    func delete(index: Int) -> ValueType?
    func deleteFirst() throws -> ValueType
}

// class for doubly linked list
class DoublyLinkedList<T>: DoublyLinkedListing, CustomStringConvertible {
    typealias ValueType = T
    var head: DoublyNote<T>?
    
    init(_ value: ValueType? = nil) {
        if let value = value {
            self.head = DoublyNote(value: value)
        }
    }
    
    func insertFirst(_ value: ValueType) {
        let note = DoublyNote(value: value)
        guard let head = head else {
            self.head = note
            return
        }
        head.previous = note
        note.next = head
        self.head = note
    }
    
    func insert(value: ValueType, at index: Int) throws {
        guard let element = getElement(by: index) else {
            throw LinkError.notExistItem
        }
 
        let note = DoublyNote(value: value)
        
        let previous = element.previous
        
        note.previous = previous
        note.next = element
    
        previous?.next = note
        element.previous = note
    }
    
    func append(_ value: ValueType) {
        let note = DoublyNote(value: value)
        guard head != nil else {
            head = note
            return
        }
        let lastItem = self.last()
        lastItem?.next = note
        note.previous = lastItem
    }
    
    @discardableResult
    func deleteLast() throws -> ValueType  {
        guard let head = head else {
            throw LinkError.listIsEmpty
        }
        if head.next == nil {
            self.head = nil
            return head.value
        }
        var current = head
        var before = head
        while let next = current.next {
            before = current
            current = next
        }
        current.previous = nil
        before.next = nil
        return current.value
    }
    
    @discardableResult
    func delete(index: Int) -> ValueType? {
        guard let element = getElement(by: index) else {
            return nil
        }
        let next = element.next
        let prev = element.previous
        prev?.next = next
        next?.previous = prev
        return element.value
    }
    
    @discardableResult
    func deleteFirst() throws -> ValueType {
        guard let head = head else {
            throw LinkError.listIsEmpty
        }
        let next = head.next
        next?.previous = nil
        self.head = next
        return head.value
    }
        
    func getValue(index: Int) throws -> ValueType {
        if let value = getElement(by: index)?.value {
            return value
        }
        throw LinkError.notFound
    }
    
    var description: String {
        var arr = [String?]()
        var current = head
        while current != nil {
            arr.append(current?.description)
            current = current?.next
        }
        return arr.compactMap({$0}).joined(separator: " --> ")
    }
}

let list2 = DoublyLinkedList("D Test 0")
list2.append("D Test 1")
list2.append("D Test 2")
list2.append("D Test 3")
print("\n ----- Doubly Linked List -----")
print(list2)

list2.insertFirst("D Test First")
print(list2)
do {
    try list2.insert(value: "Insert__Test", at: 2)
    print(list2)
} catch {
    print("** Error inser: \(error)")
}

do {
    print("Delete first: ", try list2.deleteFirst())
    print(list2)
} catch {
    print("** Error delete: \(error)")
}

list2.delete(index: 1)
print(list2)
