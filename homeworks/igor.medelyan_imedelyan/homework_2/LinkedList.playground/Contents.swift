import UIKit

/**
 Реализовать однонаправленный и двунаправленный список.
 Эти списки должны реализовывать (конфирмить) ваш протокол LinkedList.
 Интерфейс (список функций и полей) у протокола и реализациях протокола - на ваше усмотрение, но должна быть возможность добавить и удалить элемент из списка.
 Эти списки должны иметь возможность работать с любыми типами данных (нужно использовать generic`и).
 В качестве узлов (nodes) использовать объекты структур, если у кого-то возникают проблемы с структурами - тогда можно использовать класс.
 В вашей реализации должна быть, как минимум, одна функция, которая может возвращать ошибку.
 Также необходимо написать extension к LinkedList, который будет давать возможность добавлять в список все элементы из другого списка.
*/

protocol LinkedList {
    associatedtype T
    var head: Node<T>? { get }
    var count: Int { get }
    var isEmpty: Bool { get }
    func getNode(at index: Int) throws -> Node<T>?
    func append(value: T)
    func append(_ node: Node<T>)
    func removeNode(at index: Int) throws
    func removeLast()
    mutating func appendElementsFromList(_ list: Self)
}

class Node<T> {
    var value: T
    var nextNode: Node?
    var prevNode: Node?
    
    init(value: T) {
        self.value = value
    }
}

enum LinkedListError: Error {
    case nodeDoesntExist
}

// Singly Linked List

class SinglyLinkedList<T> {
    var head: Node<T>? = nil
    
    convenience init(array: Array<T>) {
        self.init()
        array.forEach { append(value: $0) }
    }
}

extension SinglyLinkedList: LinkedList {

    func append(_ newNode: Node<T>) {
        // check if list is empty
        guard !isEmpty else {
            head = newNode
            return
        }
        
        do {
            if let lastNode = try getNode(at: count - 1) {
                lastNode.nextNode = newNode
            }
        } catch {
            
        }
    }
    
    func removeNode(at index: Int) throws {
        do {
            let nodeToRemove = try getNode(at: index)
            
            // check if it's the head
            guard index != 0 else {
                head = head?.nextNode
                return
            }
            
            let prevNode = try getNode(at: index - 1)
            prevNode?.nextNode = nodeToRemove?.nextNode
        } catch {
            throw error
        }
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    var description: String {
        guard !isEmpty else { return "[]" }
        var desc = "["
        for i in 0...count - 1 {
            let nodeDesc = try! getNode(at: i)?.value
            desc += " \(String(describing: nodeDesc!))"
        }
        return desc + " ]"
    }
}

// Doubly Linked List

class DoublyLinkedList<T> {
    var head: Node<T>? = nil
    
    convenience init(array: Array<T>) {
        self.init()
        array.forEach { append(value: $0) }
    }
}

extension DoublyLinkedList: LinkedList {
    
    func append(_ newNode: Node<T>) {
        // check if list is empty
        guard !isEmpty else {
            head = newNode
            return
        }
        
        do {
            if let lastNode = try getNode(at: count - 1) {
                newNode.prevNode = lastNode
                lastNode.nextNode = newNode
            }
        } catch {
            
        }
    }
    
    func removeNode(at index: Int) throws {
        do {
            let nodeToRemove = try getNode(at: index)
            
            // check if it's the head
            guard index != 0 else {
                head = head?.nextNode
                head?.prevNode = nil
                return
            }
            
            let prevNode = nodeToRemove?.prevNode
            let nextNode = nodeToRemove?.nextNode
            prevNode?.nextNode = nextNode
            nextNode?.prevNode = prevNode
        } catch {
            throw error
        }
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        guard !isEmpty else { return "[]" }
        var desc = "["
        for i in 0...count - 1 {
            let nodeDesc = try! getNode(at: i)?.value
            desc += " \(String(describing: nodeDesc!))"
        }
        return desc + " ]"
    }
}

// Extension LinkedList

extension LinkedList {
    var count: Int {
        var n = 0
        var node = head
        while node != nil {
            node = node?.nextNode
            n += 1
        }
        return n
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: T) {
        append(Node(value: value))
    }
    
    func removeLast() {
        guard count != 0 else { return }
        do {
            try removeNode(at: count - 1)
        } catch {

        }
    }
    
    func getNode(at index: Int) throws -> Node<T>? {
        var node = head
        for i in 0...index {
            guard node != nil else { throw LinkedListError.nodeDoesntExist }
            if i == index { break }
            node = node?.nextNode
        }
        return node
    }
    
    mutating func appendElementsFromList(_ list: Self) {
        if let firstNode = list.head {
            append(firstNode)
        }
    }
}

// Testing singly linked list

var list = SinglyLinkedList<String>()
assert(list.isEmpty == true)
assert(list.head == nil)

list.append(value: "A")
assert(list.isEmpty == false)
list.head!.value
list.count
print(list)

list.append(value: "B")
list.append(value: "C")
list.append(value: "D")
list.append(value: "E")
list.head!.value
list.head!.nextNode!.value
try list.getNode(at: 3)!.nextNode!.value
try list.getNode(at: 3)!.prevNode
list.count
print(list)

list.removeLast()
try list.removeNode(at: 2)
list.count
print(list)

let anotherList = SinglyLinkedList.init(array: ["F", "G", "H"])
list.appendElementsFromList(anotherList)
list.count
print(list)

// Testing doubly linked list

var dList = DoublyLinkedList<Int>()
assert(dList.isEmpty == true)
assert(dList.head == nil)

dList.append(value: 1)
assert(dList.isEmpty == false)
dList.head!.value
dList.count
print(dList)

dList.append(value: 2)
dList.append(value: 3)
dList.append(value: 4)
dList.append(value: 5)
dList.head!.value
dList.head!.prevNode
dList.head!.nextNode!.value
try dList.getNode(at: 3)!.nextNode!.value
try dList.getNode(at: 3)!.prevNode!.value
dList.count
print(dList)

dList.removeLast()
try dList.removeNode(at: 2)
dList.count
print(dList)

let anotherDList = DoublyLinkedList.init(array: [6, 7, 8])
dList.appendElementsFromList(anotherDList)
dList.count
print(dList)

