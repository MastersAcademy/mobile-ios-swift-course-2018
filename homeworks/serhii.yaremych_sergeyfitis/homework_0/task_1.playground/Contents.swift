import UIKit

let str: String = "str"
let int: Int = 0
let unsignedInt: UInt = 0
let double: Double = 0.0
let float: Float = 0.0
let char: Character = "a"
let boolean: Bool = false

print("str=\(str);int=\(int);\nunsignedInt=\(unsignedInt);double=\(double);float=\(float);char=\(char);boolean=\(boolean)")

var a = 1
while (a <= 10) {
    print("a=\(a)")
    a += 1
}

var b = 1
repeat {
    print("b=\(b)")
    b += 1
} while b <= 10

for c in 1...10 {
    print("c=\(c)")
}

let someString = String("abc")
let someString2 = String.init("abc")
let someString3 = "abc"
let someString4 = """
abc
"""
let intVal = 10
switch intVal {
case 5...20:
    print("intVal in range 5..20=\(intVal)")
case let val where val > 35 :
    print("intVal above 35=\(intVal)")
default:
    break
}

enum MyError : Error {
    case runtimeError(String)
}

throw MyError.runtimeError("😈")
