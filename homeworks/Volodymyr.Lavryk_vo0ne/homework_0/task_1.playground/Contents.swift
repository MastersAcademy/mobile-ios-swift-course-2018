import UIKit

//MARK: 1 VALUES DECLARATION

var str = "Hello, world"
var booleanVar  = true
var int = 1
var doubleVar = 1.1234567890
var floatVar: Float = 1.1234567890
var array = [1, 3, 4]
var dict = ["key1": "value1", "key2": "value2"]
var setVar: Set<String> = ["Set", "value"]
var char = str.first!
var tuple = (0,0)
var any: Any = 0
var handler: ()->String = { return "handler" }

//MARK: 2 PRINT VALUES
let arrayOfTypes: [Any] = [str, booleanVar, int, doubleVar, floatVar, array, dict, setVar, char, tuple,any, handler]
for item in arrayOfTypes {
    print (item)
}

//MARK: 3 LOOPS

for i in 1...10 {
    print( "this is :", i)
}
var i = 1
while i <= 10 {
    
    print ("this is", i)
    i += 1
    
}
 i = 1
repeat {
    print("this is", i)
    i += 1
} while (i <= 10)

//MARK: 4 STRING INITIALIZATION

let str1 = String()
var str2 = "string"
let str3 = String(char)
let str4 = """
String Literals
"""
let str5 = "\u{1F496}"
let str6 = str4 + str5

//MARK 5

var random = Int.random(in: 0...100)
switch random {
case 5...20:
    print("value is ", random)
case let i where i > 35:
    print("value is ", random)
default:
    print ("Sorry value \(random) out of range")
}

// MARK: 011

var item: Int? = nil
print(item!)





