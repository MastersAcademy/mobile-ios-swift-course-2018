import UIKit

//Огласить и инициализировать переменные всех фундаментальных типов которые сможете найти (до 20)
var i: Int = .max
var i8: Int8 = .max
var i16: Int16 = .max
var i32: Int32 = .max
var i64: Int64 = .max
var f: Float = 1.123456
var f32: Float32 = 1.123456
var f64: Float64 = 1.123456789012345
var f80: Float80 = 1.1234567890123456789
var d: Double = 1.123456789012345
var b: Bool = true
var chr: Character = "q"
var str: String = "Hello Playground"

//С помощью функции print поочередно вывести обьявленные переменные в консоль
let array: [Any] = [i, i8, i16, i32, i64, f, f32, f64, f80, d, b, chr, str]
for item in array {
    print(item)
}

//Создать три цикла (while, while-repeat, for) и с помощью функции print вывести значения от 1 до 10 в консоль
    //while
i = 1
while (i <= 10) {
    print(i)
    i += 1
}

    //while-repeat
//i = 1
repeat {
    print(i)
    i += 1
} while (i <= 10)

    //for
//i = 1
for i in 1...10 {
    print(i)
}

//Создать экземпляры структуры String наибольшым количеством способом которые сможете придумать (начинайте с String(), искать по ключевым словам initialization, String, swift)
let str1: String = "Hello Playgroung"
let str2: String = """
Swift is a powerful and intuitive programming language for macOS, iOS, watchOS and tvOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast.
"""
let str3 = "Swift"
let str4 = String(4)
let str5 = str3 + " " + str4
let srt6 = "\(str3) \(str4)"

//Создать пермененную типа Int и switch который с помощью функции print выведет значение в консоль, если значение в диапазоне от 5 до 20 (включительно) или более 35
var num = Int.random(in: 0..<50)

switch num {
case 5...20:
    print(num)
case 36...:
    print(num)
default:
    print("\(num) out of value range")
}

//Написать любой код который приведет к крешу playground-а (выводу error: Execution was interrupted \ Fatal error). Ключевые слова: crash, stack trac, program termination, fatal error, swift
//let x = 0, y = x/x

//Напишите самый короткий код который приведет к крешу playground-а
//+
