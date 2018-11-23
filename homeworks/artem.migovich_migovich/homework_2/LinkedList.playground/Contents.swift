import UIKit

protocol LinkedListProtocol {
    associatedtype T
    var head: LinkedList<T>.Node? { get }
    var tail: LinkedList<T>.Node? { get }
    func append(_ value: T)
    func push(_ value: T)
    func popLast() throws -> LinkedList<T>.Node?
    func pop(index: Int) throws -> LinkedList<T>.Node?
    var isEmpty: Bool { get }
    var count: Int { get }
    subscript (index: Int) -> LinkedList<T>.Node? { get }
}

enum LinkedListError: Error {
    case emptyCollection(String)
    case outOfRange(String)
}

class LinkedList<T>: LinkedListProtocol {
    
    lazy private var nodes = [Node]()
    
    class Node: CustomDebugStringConvertible {
        
        let value: T
        fileprivate(set) weak var next: Node?
        fileprivate(set) weak var previous: Node?
        
        init(value: T) {
            self.value = value
            next = nil
        }
        
        var debugDescription: String {
            return "Value = \(value)"
        }
    }
    
    var head: Node? {
        return nodes.first
    }
    
    var tail: Node? {
        return nodes.last
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        tail?.next = newNode
        nodes.append(newNode)
    }
    
    var count: Int {
        return nodes.count
    }
    
    subscript (index: Int) -> Node? {
        guard nodes.count > index else { return nil }
        return nodes[index]
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func push(_ value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        nodes.insert(newNode, at: 0)
    }

    func popLast() throws -> Node? {
        guard nodes.count != 0 else { throw LinkedListError.emptyCollection("Linked list has no objects") }
        return nodes.removeLast()
    }
    
    func pop(index: Int) throws -> Node? {
        guard nodes.count != 0 else { throw LinkedListError.emptyCollection("Linked list has no objects") }
        guard nodes.count > index && index >= 0 else { throw LinkedListError.outOfRange("Index is out of range") }
        return nodes.remove(at: index)
    }
}

extension LinkedList: Sequence {

    typealias Element = Node
    typealias Iterator = IndexingIterator<[Node]>
    typealias SubSequence = AnySequence<Node>

    func makeIterator() -> IndexingIterator<[LinkedList<T>.Node]> {
        return nodes.makeIterator()
    }
}

extension LinkedList: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return nodes.compactMap{$0.value}.debugDescription
    }

    func appendList(_ list: LinkedList<T>)  {
        for element in list {
            if list.head != nil {
                tail?.next = list.head
                nodes.append(element)
            }
        }
    }
    
    func clearList() {
        for _ in 0...strList.count {
            try? strList.popLast()
        }
    }
}

var strList = LinkedList<String>()

strList.append("A")
strList.append("B")
strList.append("C")
strList.append("D")

print(strList)

try strList.popLast()
print(strList)

let strList2 = LinkedList<String>()
strList2.append("X")
strList2.append("Y")
strList2.append("Z")

strList.appendList(strList2)
print(strList)
strList.count
strList.clearList()
strList.isEmpty




