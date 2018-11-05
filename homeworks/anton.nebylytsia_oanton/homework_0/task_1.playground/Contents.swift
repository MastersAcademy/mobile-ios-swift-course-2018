import UIKit
import Swift
import Darwin

// MARK: Task 001 Subtask 2

let string: String = "Text"
let bool: Bool = true
let int: Int = Int.max
let int8: Int8 = Int8.max
let int16: Int16 = Int16.max
let int32: Int32 = Int32.max
let int64: Int64 = Int64.max
let uInt: UInt = UInt.max
let uInt8: UInt8 = UInt8.max
let uInt16: UInt16 = UInt16.max
let uInt32: UInt32 = UInt32.max
let uInt64: UInt64 = UInt64.max
let float: Float = MAXFLOAT
let double: Double = Double.greatestFiniteMagnitude
let float80: Float80 = Float80.greatestFiniteMagnitude
let character: Character = "A"
let array: [String] = ["First", "Second"]
let set : Set = ["First", "Second", "Third", "Third"]
let dictionary: [String: Int] = ["key1": 1, "key2": 2]
let tuple = (top: 10, bottom: 12) // Tuple Type
let range: CountableClosedRange = 1...3

class ClassType {}
let aClass: ClassType = ClassType()

let block: (Float) -> Void = { arg in }

let data: Data = Data()
let date: Date = Date()



// MARK: Task 001 Subtask 3

print("1. \(type(of: string)): \(string)")
print("2. \(type(of: bool)): \(bool)")
print("3. \(type(of: int)): \(int)")
print("4. \(type(of: int8)): \(int8)")
print("5. \(type(of: int16)): \(int16)")
print("6. \(type(of: int32)): \(int32)")
print("7. \(type(of: int64)): \(int64)")
print("8. \(type(of: uInt)): \(uInt)")
print("9. \(type(of: uInt8)): \(uInt8)")
print("10. \(type(of: uInt16)): \(uInt16)")
print("11. \(type(of: uInt32)): \(uInt32)")
print("12. \(type(of: uInt64)): \(uInt64)")
print("13. \(type(of: float)): \(float)")
print("14. \(type(of: double)): \(double)")
print("15. \(type(of: float80)): \(float80)")
print("16. \(type(of: character)): \(character)")
print("17. \(type(of: array)): \(array)")
print("18. \(type(of: set)): \(set)")
print("19. \(type(of: dictionary)): \(dictionary)")
print("20. \(type(of: tuple)): \(tuple)")
print("21. \(type(of: range)): \(range)")
print("22. \(type(of: aClass)): \(aClass)")
print("23. \(type(of: block)): \(block)")
print("24. \(type(of: data)): \(data)")
print("25. \(type(of: date)): \(date)")

// MARK: Task 001 Subtask 4

print("for")
for index in 1...10 {
    print(index)
}

print("while")
var index = 0
while index < 10 {
    index += 1
    print(index)
}

print("while-repeat")
index = 0
repeat {
    index += 1
    print(index)
} while index < 10

// MARK: Task 001 Subtask 4

let string1 = "Text"
let string2 = """
These are the same.
"""
let string3 = String()
let string4 = String.init()
let string5 = 1234.description
let string6 = String(1234)
let string7 = String(format: "%d, %d", 12.3, 4.5)
let string8 = String(repeating: "a", count: 3)
let string9 = String(bytes: Data(), encoding: .utf8)
let string10 = String(bytes: [0, 0, 0], encoding: .utf8)
let string11 = String(["1", "2", "3", "4", "5"])
let string12 = try String(contentsOf: URL(string: "https://google.com")!)
let strIndex = string5.index(string5.startIndex, offsetBy:2)
let string13 = string11[..<strIndex]
let string14 = "\(string5) \(string6)"
let string15 = string14 + " Cafe\u{301} du 🌍"

// MARK: Task 001 Subtask 6

var i = Int.random(in: 0..<50)

print("swith #1")

switch i {
case 5...20, 36...:
    print("Value is \(i)")
default:
    print ("Value \(i) out of range")
}

print("swith #2")

switch i {
case 5...20:
    print("Value is \(i)")
case let i where i > 35:
    print("Value is \(i)")
default:
    print ("Value \(i) out of range")
}
