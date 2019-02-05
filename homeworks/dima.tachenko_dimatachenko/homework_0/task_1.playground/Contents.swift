import UIKit

// types
let str: String = "task_1"
print("String: \(str)")

let int8: Int8 = .max
print("Int8: \(int8)")

let uInt8: UInt8 = .max
print("Uint8: \(uInt8)")

let int16: Int16 = .max
print("Int16: \(int16)")

let uInt16: UInt16 = .max
print("Uint16: \(uInt16)")

let int32: Int32 = .max
print("Int32: \(int32)")

let uInt32: UInt32 = .max
print("Uint32: \(uInt32)")

let int64: Int64 = .max
print("Int64: \(int64)")

let uInt64: UInt64 = .max
print("Uint64: \(uInt64)")

let int: Int = .max
print("Int: \(int)")

let uInt: UInt = .max
print("Uint: \(uInt)")

let float: Float = 0.0
print("Float: \(float)")

let double: Double = 0.1
print("Double: \(double)")

let bool: Bool = true
print("Bool: \(bool)")

let character: Character = "z"
print("Character: \(character)")

let arr: Array = [1, 2, 3]
print("Array: \(arr)")

let dict: [String: String] = ["Dad": "Bob", "Mom": "Joly"]
print("Dictionary: \(dict)")

let tuples: (String, String) = ("John", "Smith")
print("Tuples: \(tuples)")

let data: Data = Data()
print("Data:", data)

let range: Range = 0..<3
print("Range:", range)

// loops
var item = 1
while item <= 10 {
    print(item)
    item += 1
}

item = 1
repeat {
    print(item)
    item += 1
} while item <= 10

for item in 1...10 {
    
    print(item)
}

// initialization String
let str1 = String()
let str2 = ""
var str3 = "Hello swift"
let str4 = """
Welcom
Multiline
"""
let str5 = 5.description
let str6 = "\u{1F496}"
let string1 = "hello"
let string2 = " there"
let str7 = string1 + string2
let number = 3
let str8 = "\(number) times 2.5 is \(Double(number) * 2.5)"
let char: Character = "a"
let str9 = String(char)
let str10 = String(repeating: "ab", count: 10)
let elem1 = "1"
let elem2 = "2"
let format = "%@ != %@"
let str11 = String(format: format, elem1, elem2)
let str12 = str3.prefix(5)
let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
let str13 = String(str3.lazy.filter { !vowels.contains($0) })
let str14 = Array(repeating: "Z", count: 5)
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let str15 = String(catCharacters)

// int & switch
var num = Int.random(in: 0..<40)

switch num {
case 5...20:
    print(num)
case let number where number > 35:
    print(num)
default:
    print("Error")
}

