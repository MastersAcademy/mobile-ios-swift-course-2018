import UIKit

protocol LinkedList: class, Sequence, CustomStringConvertible {
    associatedtype T
    var count: Int { get }
    var isEmpty: Bool { get }
    func add(value: T)
    func remove(value: T) -> Bool
    func remove(index: Int) throws -> Bool
}

enum LinkedListError: Error {
    case indexOutOfBounds
}

extension LinkedList {
    public var description: String {
        var text = ""
        for node in self {
            if !text.isEmpty {
                text += ", "
            }
            text += "\(node)"
        }
        return "[\(text)]"
    }
}

extension LinkedList where T == Self.Element {
    func append(contentsOf elements: Self) {
        for e in elements {
            self.add(value: e)
        }
    }
}

public struct LinkedListIterator<T: Equatable>: IteratorProtocol {
    private var current: Node<T>?
    
    init(head: Node<T>?) {
        current = head
    }
    public mutating func next() -> T? {
        guard let this = current else {
            return nil
        }
        current = this.next
        return this.value
    }
}

public class Node<T: Equatable>: CustomStringConvertible {
    let value: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    public var description: String {
        return "node:\(value)"
    }
}

public class SinglyLinkedList<T: Equatable>: LinkedList {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var size: Int = 0
    
    public func add(value: T) {
        let node = Node(value: value)
        if isEmpty {
            head = node
        } else {
            tail?.next = node
        }
        tail = node
        size += 1
    }
    public func remove(value: T) -> Bool {
        var prev: Node<T>?
        var node = head
        while node != nil {
            if node!.value == value {
                size -= 1
                unlink(prev: prev, node: node)
                return true
            }
            prev = node
            node = node?.next
        }
        return false
    }
    public func remove(index: Int) throws -> Bool {
        if index < 0 || index >= size {
            throw LinkedListError.indexOutOfBounds
        }
        var prev: Node<T>?
        var node = head
        var i = 0
        while node != nil && i < size {
            if i == index {
                size -= 1
                unlink(prev: prev, node: node)
                return true
            }
            prev = node
            node = node?.next
            i += 1
        }
        return false
    }
    private func unlink(prev: Node<T>?, node: Node<T>?) {
        let next = node?.next
        if prev == nil {
            head = next
        } else {
            prev?.next = next
        }
    }
    public var isEmpty: Bool {
        return head == nil
    }
    public var count: Int {
        return size
    }
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(head: head)
    }
}


var list = SinglyLinkedList<String>()
list.add(value: "A")
list.add(value: "B")
list.add(value: "C")
list.add(value: "D")
list.remove(value: "B")
do {
    try list.remove(index: 1)
    try list.remove(index: 99)
} catch {
    print("Unexpected error: \(error).")
}

print(list)
for element in list {
    print(element)
}


public class DoublyLinkedList<T: Equatable>: LinkedList {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var size: Int = 0
    
    public func add(value: T) {
        let node = Node(value: value)
        if isEmpty {
            head = node
        } else {
            tail?.next = node
            node.prev = tail
        }
        tail = node
        size += 1
    }
    public func remove(value: T) -> Bool {
        var prev: Node<T>?
        var node = head
        while node != nil {
            if node!.value == value {
                size -= 1
                unlink(prev: prev, node: node)
                return true
            }
            prev = node
            node = node?.next
        }
        return false
    }
    public func remove(index: Int) throws -> Bool {
        if index < 0 || index >= size {
            throw LinkedListError.indexOutOfBounds
        }
        var prev: Node<T>?
        var node = head
        var i = 0
        while node != nil && i < size {
            if i == index {
                size -= 1
                unlink(prev: prev, node: node)
                return true
            }
            prev = node
            node = node?.next
            i += 1
        }
        return false
    }
    private func unlink(prev: Node<T>?, node: Node<T>?) {
        let next = node?.next
        if prev == nil {
            head = next
        } else {
            prev?.next = next
        }
        if next != nil {
            next?.prev = prev
        }
    }
    public var isEmpty: Bool {
        return head == nil
    }
    public var count: Int {
        return size
    }
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(head: head)
    }
    public func reverse() -> DoublyLinkedList {
        var node = head
        while let current = node {
            node = current.next
            swap(&current.next, &current.prev)
            head = current
        }
        return self
    }
}

let list2 = DoublyLinkedList<String>()
list2.add(value: "A")
list2.add(value: "B")
list2.add(value: "C")
list2.add(value: "D")
print(list2)
list2.reverse()
print(list2)
for element in list2.reversed() {
    print(element)
}

print("--------")
var list3 = SinglyLinkedList<String>()
list3.add(value: "1")
list3.add(value: "2")
list3.add(value: "3")
list.append(contentsOf: list3)
print(list)
