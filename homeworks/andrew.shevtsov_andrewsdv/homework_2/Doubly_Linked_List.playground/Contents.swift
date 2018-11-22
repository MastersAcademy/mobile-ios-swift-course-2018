import UIKit

/// Homework 2

/// Реализовать однонаправленный и двунаправленный список.
// Эти списки должны реализовывать (конфирмить) ваш протокол LinkedList.
// Интерфейс (список функций и полей) у протокола и реализациях протокола - на ваше усмотрение, но должна быть возможность добавить и удалить элемент из списка.
// Эти списки должны иметь возможность работать с любыми типами данных (нужно использовать generic`и).
// В качестве узлов (nodes) использовать объекты структур, если у кого-то возникают проблемы с структурами - тогда можно использовать класс.
// В вашей реализации должна быть, как минимум, одна функция, которая может возвращать ошибку.
//Также необходимо написать extension к LinkedList, который будет давать возможность добавлять в список все элементы из другого списка.

protocol DoublyLinkedListProtocol{
    func append(item: Any)
    func remove(position: Int) throws
    func get(position: Int) throws  -> Node<Any>?
}

class Node<T: Any>: CustomStringConvertible {
    var value: T
    var nextItem: Node<T>?
    var previousItem: Node<T>?
    
    init(value: T, nextItem: Node?, previousItem: Node?){
        self.value = value
        self.nextItem = nextItem
        self.previousItem = previousItem
    }
    
    public var description: String {
        return String(describing: value)
    }
}

enum DoublyLinkedListError: Error {
    case indexOutOfBounds
}

class DoublyLinkedList<T: Any> : DoublyLinkedListProtocol, CustomStringConvertible {
    var head: Node<Any>?
    var size: Int = 0
    
    init() {
    }
    
    func append(item: Any) {
        if (head == nil) {
            head = Node.init(value: item, nextItem: nil, previousItem: nil)
        } else {
            var lastItem: Node = head!
            while lastItem.nextItem != nil {
                lastItem = lastItem.nextItem!
            }
            
            lastItem.nextItem = Node(value: item, nextItem: nil, previousItem: lastItem)
        }
        size += 1
    }
    
    func remove(position: Int) throws {
        if head == nil || position < 0 || position >= size {
            throw DoublyLinkedListError.indexOutOfBounds
        }
        
        if (position == 0) {
            head = head?.nextItem
            return
        }
        
        var currentItem: Node = head!
        var currentPosition = 1
        
        repeat {
            if (currentPosition == position) {
                currentItem.nextItem = currentItem.nextItem?.nextItem
                break
            }
            currentPosition += 1
            currentItem = currentItem.nextItem!
        } while currentPosition < position || currentItem.nextItem != nil
        
    }
    
    func get(position: Int) throws -> Node<Any>? {
        if head == nil || position < 0 || position >= size {
            throw DoublyLinkedListError.indexOutOfBounds
        }
        
        var currentItem: Node? = head!
        var currentPosition = 0
        
        while currentPosition < position && currentItem != nil {
            currentPosition += 1
            currentItem = currentItem?.nextItem
        }
        
        return currentItem
    }
    
    var description: String {
        var result = ""
        var item = head
        
        while item != nil {
            result.append(item!.description)
            result.append(" ")
            item = item!.nextItem
        }
        
        return result
    }
}


var doublyLinkedList = DoublyLinkedList<String>()
doublyLinkedList.append(item: "First")
doublyLinkedList.append(item: "Second")
doublyLinkedList.append(item: "Third")
print(doublyLinkedList)

do {
    try print(doublyLinkedList.get(position: 1)?.previousItem)
} catch DoublyLinkedListError.indexOutOfBounds {
    print("Invalid index.")
}

do {
    try print(doublyLinkedList.get(position: 1))
} catch DoublyLinkedListError.indexOutOfBounds {
    print("Invalid index.")
}

do {
    try print(doublyLinkedList.get(position: 1)?.nextItem)
} catch DoublyLinkedListError.indexOutOfBounds {
    print("Invalid index.")
}
