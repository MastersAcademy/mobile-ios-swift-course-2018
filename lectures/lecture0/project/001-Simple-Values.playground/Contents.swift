import PlaygroundSupport
import Foundation
import UIKit

//001 Basics. Simple print Hello World
print("Hello, world!")

//002. Simple values
var myVariable = 42
myVariable = 50
let myConstant = 42
print(myVariable)
print(myConstant)

//003. Inferior type OR Implict and explicit
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
print(implicitInteger)
print(explicitDouble)

//004. Value converting
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

//005. String interpolation
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)

//006. Array and dictionaries
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(shoppingList)
print(occupations)

//007. Add element to array
shoppingList.append("blue paint")
print(shoppingList)

//008. Create empty array and dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//009. Create empty inferred array and dictionary
shoppingList = []
occupations = [:]
