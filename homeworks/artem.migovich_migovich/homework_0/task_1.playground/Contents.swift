import UIKit
//Огласить и инициализировать переменные всех фундаментальных типов которые сможете найти (до 20)
var i: Int = 123
var f: Float = 1.123456
var d: Double = 1.123456789012345
var b: Bool = true
var chr: Character = "q"
var str: String = "Hello World"
//С помощью функции print поочередно вывести обьявленные переменные в консоль
print(i, f, d, b, chr, str);
//Создать три цикла (while, while-repeat, for) и с помощью функции print вывести значения от 1 до 10 в консоль
i = 1
while (i <= 10) {
    print(i)
    i += 1
}

i = 1
repeat {
    print(i)
    i += 1
} while (i <= 10)

i = 1
for i in 1...10 {
    print(i)
}
//Создать экземпляры структуры String наибольшым количеством способом которые сможете придумать (начинайте с String(), искать по ключевым словам initialization, String, swift)
let str1: String = "Hello Playgroung"
let str2: String = """
1
2
3
"""
let str3 = String(i)
let str4 = "Hello"

//Создать пермененную типа Int и switch который с помощью функции print выведет значение в консоль, если значение в диапазоне от 5 до 20 (включительно) или более 35
var num: Int = 21

switch num {
case 5...20:
    print(num)
case 36...:
    print(num)
default:
    print("num out of value range")
}
//Написать любой код который приведет к крешу playground-а (выводу error: Execution was interrupted \ Fatal error). Ключевые слова: crash, stack trac, program termination, fatal error, swift
let x = 0, y = x/x
//Напишите самый короткий код который приведет к крешу playground-а
+







