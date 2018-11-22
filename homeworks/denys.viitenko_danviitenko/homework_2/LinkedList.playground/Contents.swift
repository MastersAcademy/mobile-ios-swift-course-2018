import UIKit

protocol LinkedList {
    associatedtype T
    var isEmpty: Bool { get }
    func append(value: T)
    func printList()
    func deleteNode(position: Int) throws
}

enum PossibleErrors: Error {
    case nodeIsEmpty
}

extension LinkedList{
    func mergeTwoSingleList(secondList: SingleLinkedList<T>) {
        var snode: SingleNode? = secondList.head
        
        while snode != nil {
            append(value: snode!.value)
            snode = snode?.next
        }
    }
    func mergeTwoDoublyList(secondList: DoublyLinkedList<T>) {
        var dnode: DoublyNode? = secondList.head
        
        while dnode != nil {
            append(value: dnode!.value)
            dnode = dnode?.next
        }
    }
}

//  SingleLinkedList

class SingleNode<T> {
    let value: T
    var next: SingleNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class SingleLinkedList<T>: LinkedList{
    var head: SingleNode<T>?
    var isEmpty: Bool{ return head == nil }
    var first: SingleNode<T>? { return head }

    func append(value: T){
        let newSNode = SingleNode(value: value)
        if var h = head {
            while h.next != nil{
                h = h.next!
            }
            h.next = newSNode
        } else {
            self.head = newSNode
     }
    }
    func printList() {
        var h = head
        if h == nil{
            print("List is empty")
        }
        while h != nil {
            print("Single List \(h!.value)")
            h = h?.next
            
        }
        
    }
    func deleteNode(position: Int) throws{
        guard head != nil else {
            throw PossibleErrors.nodeIsEmpty
        }

        var t = head
        if (position == 0){
            head = t?.next
            return
        }
        for _ in 0..<(position - 1) where t != nil{
            t = t?.next
        }
        if t == nil || t?.next == nil{
            return
        }
        let nextNode = t?.next?.next
        t?.next = nextNode
        
    }
   
}

// DoublyLinkedList

class DoublyNode<T> {
    let value: T
    var next: DoublyNode?
    var previous: DoublyNode?
    
    init(value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T>: LinkedList{
    var head: DoublyNode<T>?
    var tail:DoublyNode<T>?

    var isEmpty: Bool{ return head == nil}
    var first: DoublyNode<T>? { return head }
    var last: DoublyNode<T>? { return tail }
    
    func append(value: T){
        let  newDoublyNode = DoublyNode(value: value)
        if let _tail = tail {
            _tail.next = newDoublyNode
            newDoublyNode.previous = _tail
        }else {
            head = newDoublyNode
        }
        tail = newDoublyNode
    }
    func printList() {
        var h: DoublyNode? = head
        if h == nil{
            print("List is empty")
        }
        while h != nil {
            print("Doubly List - \(h!.value)")
            h = h?.next
            
        }
    }
    
    func deleteNode(position: Int) throws{
        guard head != nil else {
            throw PossibleErrors.nodeIsEmpty
        }
        var t = head
        if (position == 0){
            head = t?.next
            return
        }
        for _ in 0..<(position - 1) where t != nil{
            t = t?.next
        }
        if t == nil || t?.next == nil{
            return
        }
        let nextNode = t?.next?.next
        t?.next = nextNode
        let prevNode = t?.previous?.previous
        t?.previous = prevNode
    }
}

// Single

var singleList = SingleLinkedList<Int>()
try? singleList.deleteNode(position: 0)
do{
    try singleList.deleteNode(position: 0)
}catch PossibleErrors.nodeIsEmpty {
    print("ErrorNode is not create!!!!!")
}

print("----Append Single List-----")
singleList.append(value: 2)
singleList.append(value: 6)
singleList.append(value: 7)
singleList.append(value: 18)
singleList.printList()

print("----Delete----")
try singleList.deleteNode(position: 1)
singleList.printList()

print("----Merge Single List----")
var secondSingleList = SingleLinkedList<Int>()
secondSingleList.append(value: 4)
secondSingleList.append(value: 43)
secondSingleList.append(value: 6)
secondSingleList.append(value: 5)
singleList.mergeTwoSingleList(secondList: secondSingleList)
singleList.printList()

// Doubly

var doublyList = DoublyLinkedList<String>()
doublyList.append(value: "A")
doublyList.append(value: "B")
doublyList.append(value: "C")
doublyList.append(value: "D")

print("----Append Doubly List-----")
doublyList.printList()

print("----Delete Doubly List-----")
try? doublyList.deleteNode(position: 0)
doublyList.printList()

print("----Merge Doubly Linked List----")
var secondDoublyList = DoublyLinkedList<String>()
secondDoublyList.append(value: "E")
secondDoublyList.append(value: "F")
secondDoublyList.append(value: "G")
doublyList.mergeTwoDoublyList(secondList: secondDoublyList)
doublyList.printList()

