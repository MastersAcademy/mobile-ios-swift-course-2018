import UIKit

var str = "Hello, playground"

let string :String = "Hello"
print(string)

let bool :Bool = false
print(bool)

let int: Int = 12
print(int)

let int8: Int8 = 127
print(int8)

let int16: Int16 = -32768
print(int16)

let int32: Int32 = Int32.min
print(int32)

let int64: Int64 = Int64.max
print(int64)

let uint: UInt = 256
print(uint)

let uint8: UInt8 = 255
print(uint8)

let uint16: UInt16 = 65535
print(uint16)

let uint32: UInt32 = UInt32.max
print(uint32)

let uint64: UInt64 = UInt64.max
print(uint64)

let float: Float = -1.1
print(float)

let float80: Float80 = 1.2
print(float80)

let double: Double = 1.3
print(double)

let http404Error = (404, "Not Found")
print(http404Error)

let threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

let favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)

let map = [1: "one", 2: "two"]
print(map)

print(Int64.max==UInt64.max/2)

// 4. loops
for index in 1...10 {
    print(index)
}

var index = 0
while index < 10 {
    index+=1
    print(index)
}

index = 0
repeat {
    index+=1
    print(index)
} while index < 10

// 5 String init
let s :String = "new"
let name = "John"
let someString = "Hello \(name)!"
let empty = String()
let another = String.init()
let repeated = String(repeating: "a", count: 3)
let multiple = """
    The White Rabbit
    """
let idx = someString.firstIndex(of: " ") ?? someString.endIndex
let beginning = someString[..<idx]
let newString = String(beginning)

// 6 switch
var i = 40
switch i {
case 5...20, 36...:
    print(i)
default:
    break
}
