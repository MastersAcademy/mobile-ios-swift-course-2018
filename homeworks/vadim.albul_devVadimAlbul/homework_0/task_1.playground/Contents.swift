import UIKit

// MARK: 001 - 1
var str: String = ""
print("String: \(str)")
var integer: Int = .max
print("Int: \(integer)")
var fl: Float = 0
print("Float: \(fl)")
var doub: Double = 0
print("Double: \(doub)")
var uInteger: UInt = .min
print("UInt: \(uInteger)")
var dict = Dictionary<String, Int>()
print("Dictionary:", dict)
var arr = [Int]()
print("Array:", arr)
var char: Character = "a"
print("Character:", char)
var integer64: Int64 = .max
print("Int64:", integer64)
var set = Set<String>()
print("set:", set)
var cgFloat: CGFloat = 0
print("CGFloat:", cgFloat)
var range: Range = 0..<10
print("Range:", range)
var tuple: (Int, Int) = (0, 0)
print("tuple:", tuple)
var any: Any = 0
print("Any:", any)
var nsNumber: NSNumber = 0
print("NSNumber:", nsNumber)
var object = NSObject()
print("NSObject:", object)
var date: Date = Date()
print("Date:", date)
var data: Data = Data()
print("Data:", data)

class SomeClass { }
let someObject = SomeClass()
print("SomeClass:", someObject)
var metatype: SomeClass.Type = SomeClass.self
print("SomeClass.Type:", metatype)
var handler: ()->String = { return "Test" }
print("handler:", handler, handler())

enum SomeEnum {
    case first
    case second(Float)
}
var enumFirst: SomeEnum = .first
var enumSecond: SomeEnum = .second(44)
print("enum:", enumFirst, enumSecond)

// MARK: 001 - loop
for index in 0..<10 {
    print("For item:", index)
}

var index = 0
while index < 10 {
    print("while item:", index)
    index += 1
}

index = 0
repeat {
    print("repeat while item:", index)
    index += 1
} while (index < 10)


// MARK: 001 - String initialization
let str1 = String()
let str2 = ""
let str3 = 0.description

let character: Character = "a"
let str4 = String(character)
let str5 = String(bytes: Data(), encoding: .utf8)

var intVar = 0
let str6 = String(intVar)
let str7 = String(repeating: "ab", count: 10)

let arrChars: [Character] = ["C", "a", "t", "!", "🐱"]
let disemvoweled = String(arrChars)

let str8 = String(format: "%d, %f", 20, 20.0)
let str9 = String(format: "%@", arrChars)

struct Point {
    let x: Int, y: Int
}
let p = Point(x: 21, y: 30)
let str10 = String(describing: p)
let str11 = String(reflecting: p)

let str12 = try? String(contentsOf: URL(string: "https://www.w3.org/TR/PNG/iso_8859-1.txt")!, encoding: .utf8)
let str13 = """
    Test
    Test

    Test
"""

let str14 = "\u{24}"


// MARK: 001 - switch case
func printItem(_ item: Int) {
    switch item {
    case 5...20:
        print(item)
    case let x where x > 30:
        print(item)
    default: break
    }
}

printItem(35)
printItem(1)
printItem(20)
