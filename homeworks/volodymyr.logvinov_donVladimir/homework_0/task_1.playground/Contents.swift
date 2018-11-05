import UIKit

var a: Int = 0
var b: UInt = 1

var c: Int8 = 2
var d: Int16 = 3
var e: Int32 = 4
var f: Int64 = 5

var g: Float = 6.0
var h: Double = 7.0

var i: Float32 = 8.0
var j: Float64 = 9.0

var k: Bool = false
var l: Character = "A"

var m: String = "ABC"

var n: Int?
var o: Float?
var p: Bool?
var q: String?

var r: [Int] = []
var s: [String: Int] = [:]

print("\(a)\n\(b)\n\(c)\n\(d)\n\(e)\n\(f)\n\(g)\n\(h)\n\(i)\n\(j)\n\(k)\n\(l)\n\(m)")

r.append(42)
s["First"] = 1

print(r)
print(s)

for num in 1...10 {
    print(num)
}

var num2 = 1
while num2 <= 10 {
    print(num2)
    num2 += 1
}

var num3 = 1
repeat {
    print(num3)
    num3 += 1
} while num3 <= 10

print([Int](1...10).reduce("") {"\($0)\($1)\n"})

let str = String("test")
let str2 = String.init("test")
let str3 = "test"
let str4 = str3[..<str3.endIndex]
var str5 = String()
str5.insert("A", at: str5.startIndex)
var str6 = String()
str6.append("test")

let random = Int.random(in: 0...100)

switch random {
case 5..<20, 35...:
    print(random)
default:
    break
}

n! += 1
