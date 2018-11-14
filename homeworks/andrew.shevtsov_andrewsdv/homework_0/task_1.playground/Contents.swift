import UIKit


// Task 001. Subtask 1,2.
print("Task 001. Subtask 1,2.")


let bool: Bool = true
print(bool)

let int: Int = Int.max
print(int)

let int8: Int8 = Int8.max
print(int8)

let int16: Int16 = Int16.max
print(int16)

let int32: Int32 = Int32.max
print(int32)

let int64: Int64 = Int64.max
print(int64)

let uint: UInt = UInt.max
print(uint)

let float: Float = MAXFLOAT
print(float)

let double: Double = Double.greatestFiniteMagnitude
print(double)

let char: Character = "Y"
print(char)

let string: String = "Some message"
print(string)

let array: [String] = ["Array item 1", "Array item 2"]
print(array)

let set : Set = ["Set item 1", "Set item 2", "Set item 3"]
print(set)

let dictionary: [String: Int] = ["Key 1": 1, "Key 2": 2]
print(dictionary)

let tuple = (min: Int8.min, max: Int8.max)
print(tuple)


// Task 001. Subtask 3.
print("Task 001. Subtask 3.")


print("'for' loop")
for index in 1...10 {
    print(index)
}

print("'while' loop")
var index = 1
while index <= 10 {
    print(index)
    index += 1
}

print("while-repeat")
index = 1
repeat {
    print(index)
    index += 1
} while index <= 10


// Task 001. Subtask 4.
print("Task 001. Subtask 4.")

var emptyString = String()
var string2 = String("string2")
var string3 = String.init()
var string4 = "string4"
var string5: String = "string5"
var string6 = 123.description
var string7 = String(repeating: "abc", count: 5)


// Task 001. Subtask 5.
print("Task 001. Subtask 5.")

var value: Int = 36
switch value {
case 5...20, 36...:
    print(value)
default:
    break
    // Nothing to do in this case
}

// Task 001. Subtask 6.
print("Task 001. Subtask 6.")
var data = ["1", "2"]
print(data[4])


var error: String = nil!
