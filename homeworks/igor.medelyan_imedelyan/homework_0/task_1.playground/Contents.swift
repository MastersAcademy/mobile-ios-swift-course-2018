import UIKit


// 001-02, 03: Common types of variables

let myString: String = "My sring"
print("String: \(myString)")

let myInt: Int = -12345
print("Int: \(myInt)")

let myUInt: UInt = 12345
print("UInt: \(myUInt)")

let myFloat: Float = 1.2345
print("Float: \(myFloat)")

let myDouble: Double = -1.2345
print("Double: \(myDouble)")

let myBool: Bool = true
print("Bool: \(myBool)")

let myArray: Array = [5, 4, 3, 2, 1]
print("Array: \(myArray)")

let myDictionary: [String: Any] = [
    "My": "Dictionary"
]
print("Dictionary: \(myDictionary)")

let mySet: Set = ["My", "set"]
print("Dictionary: \(mySet)")

let myCharacter: Character = "m"
print("Character: \(myCharacter)")

let myRange: Range = 1..<5
print("Range:", myRange)

let myTuple: (String, String) = ("My", "tuple")
print("Tuples: \(myTuple)")

let myData: Data = Data()
print("Data:", myData)

let myDate: Date = Date()
print("Date:", myDate)


// 001-04: Loops

print("Loop While elements:")
var i = 1
while i <= 10 {
    print(i)
    i += 1
}

print("Loop Repeat-While elements:")
i = 1
repeat {
    print(i)
    i += 1
} while i <= 10

print("Loop For elements:")
for i in 1...10 {
    print(i)
}


// 001-05: String initialization

let string1 = ""
let string2 = String()
let string3 = String.init()
let string4 = 12345.description
let string5 = String(12345)
let string6 = String(format: "%d, %d", 12.3, 4.5)
let string7 = String(repeating: "m", count: 5)
let string8 = String(bytes: Data(), encoding: .utf8)
let string9 = String(bytes: [0, 0, 0], encoding: .utf8)
let string10 = String(["1", "2", "3", "4", "5"])
let string11 = try String(contentsOf: URL(string: "https://en.wikipedia.org/wiki/URL")!)


// 001-06: Switch Int

let x = 12345
switch x {
case 5...20:
    print("Int: /(x)")
case let x where x > 35:
    print("Int: /(x)")
default: break
}


// 011: Crash

let y: Int? = nil
let z = y!
