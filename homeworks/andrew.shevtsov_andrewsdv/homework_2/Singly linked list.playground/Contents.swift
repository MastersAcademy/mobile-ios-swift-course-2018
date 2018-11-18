import UIKit

/// Homework 2

/// Реализовать однонаправленный и двунаправленный список.
// Эти списки должны реализовывать (конфирмить) ваш протокол LinkedList.
// Интерфейс (список функций и полей) у протокола и реализациях протокола - на ваше усмотрение, но должна быть возможность добавить и удалить элемент из списка.
// Эти списки должны иметь возможность работать с любыми типами данных (нужно использовать generic`и).
// В качестве узлов (nodes) использовать объекты структур, если у кого-то возникают проблемы с структурами - тогда можно использовать класс.
// В вашей реализации должна быть, как минимум, одна функция, которая может возвращать ошибку.
//Также необходимо написать extension к LinkedList, который будет давать возможность добавлять в список все элементы из другого списка.

protocol SinglyLinkedListProtocol{
    func append(item: Any)
    func remove(position: Int) throws
}

class Node<T: Any>: CustomStringConvertible {
    var value: T
    var nextItem: Node<T>?
    
    init(value: T, nextItem: Node?){
        self.value = value
        self.nextItem = nextItem
    }
    
    public var description: String {
         return String(describing: value)
    }
}

enum SinglyLinkedListError: Error {
    case indexOutOfBounds
}

class SinglyLinkedList<T: Any> : SinglyLinkedListProtocol, CustomStringConvertible {
    var head: Node<Any>?
    var size: Int = 0
    
    init() {
    }
    
    func append(item: Any) {
        if (head == nil) {
            head = Node.init(value: item, nextItem: nil)
        } else {
            var lastItem: Node = head!
            while lastItem.nextItem != nil {
                lastItem = lastItem.nextItem!
            }
            
            lastItem.nextItem = Node(value: item, nextItem: nil)
        }
        size += 1
    }
    
    func remove(position: Int) throws {
        if head == nil || position < 0 || position >= size {
            throw SinglyLinkedListError.indexOutOfBounds
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


var singlyLinkedList = SinglyLinkedList<String>()
singlyLinkedList.append(item: "First")
singlyLinkedList.append(item: "Second")
singlyLinkedList.append(item: "Third")
do {
    try singlyLinkedList.remove(position: 1)
} catch SinglyLinkedListError.indexOutOfBounds {
    print("Invalid index.")
}
print(singlyLinkedList)


extension SinglyLinkedList {
    func append(list: SinglyLinkedList) {
        if list.head == nil {
            return
        } else {
            self.append(item: list.head!)
            
            var item = list.head
            while item?.nextItem != nil {
                self.append(item: item!.nextItem!)
                item = item?.nextItem
            }
        }
    }
}

var list1 = SinglyLinkedList<String>()
list1.append(item: "1")
list1.append(item: "2")
list1.append(item: "3")
print(list1)

var list2 = SinglyLinkedList<String>()
list2.append(item: "4")
list2.append(item: "5")
list2.append(item: "6")
print(list2)

list1.append(list: list2)
print(list1)


