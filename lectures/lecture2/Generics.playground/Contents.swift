import Foundation

/* using Any
 
 func makeArray(repeating item: Any, numberOfTimes: Int) -> [Any] {
 var result = [Any]()
 for _ in 0..<numberOfTimes {
 result.append(item)
 }
 return result
 }
 */

// generic function
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 2)
makeArray(repeating: 0, numberOfTimes: 3)

struct A {
    func a() {}
}
let array = makeArray(repeating: A(), numberOfTimes: 4)

for item in array {
    item.a()
}

// generic type
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


var stack = Stack<String>()

stack.push("A")
stack.push("B")

stack.pop()

print(stack.items)

// extension
extension Stack where Element: Numeric {
    var sum: Element {
        var sum : Element = 0
        
        items.forEach{ sum += $0 }
        
        return sum
    }
}


var intStack = Stack<Int>()

intStack.push(5)
intStack.push(4)

print(intStack.sum)
