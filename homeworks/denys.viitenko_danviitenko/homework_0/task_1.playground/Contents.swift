import UIKit
import Foundation
//001.2
let int8: Int8 = Int8.max
let uint8: UInt8 = UInt8.max
let int16: Int16 = Int16.max
let uInt16: UInt16 = UInt16.max
let int32: Int32 = Int32.max
let uInt32: UInt32 = UInt32.max
let int64: Int64 = Int64.max
let uInt64: UInt64 = UInt64.max
let int: Int = Int.max
let uInt: UInt = UInt.max
let float: Float = MAXFLOAT
let double: Double = 0.00
let bool: Bool = true
let string: String = "type String"
let character: Character = "A"

//001.3
print(" int8: \(int8)","\n uint8: \(uint8)","i\n int16: \(int16)","\n uInt16: \(uInt16)","\n int32: \(int32)","\n uInt32: \(uInt32)","\n int64: \(int64)","\n uInt64: \(uInt64)","\n int: \(int)","\n uInt: \(uInt)","\n float: \(float)","\n double: \(double)","\n bool: \(bool)","\n string: \(string)","\n character: \(character)")

//001.4
//For
for i in 1...10 {
    print("For: \(i)")
}
//while
var a = 0
while a < 10 {
    a += 1
    print("while: \(a)")
}
// repeat - while
var b = 0
repeat {
    b += 1
    print("repeat-while: \(b)")
} while b < 10

//001.5 
let str = ""
let str1 = String()
let str2 = String(repeating: "Str", count: 10)

let char: Character = "a"
let str3 = String(repeating: char, count: 5)
let str4 = String(char)

//001.6
var h = 10
switch h {
case 5..<20:
    print("switch 5 to 20: \(h)")
case _ where 35<h:
    print("switch 5 to 20: \(h)")
default:
    break
}

//011.2
var opt: String? = nil
print(opt!)



