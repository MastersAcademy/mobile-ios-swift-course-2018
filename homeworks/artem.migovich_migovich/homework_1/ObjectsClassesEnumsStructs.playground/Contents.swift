import UIKit
import Darwin

class Shape {
    var numberOfSides = 0
    let color: Int = 0xFF0000
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func colorOfShape() -> String {
        return color.description
    }
}

let example = Shape.init()

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

NamedShape(name: "Name")

/*Задание №1
Создайте подкласс Circle класса NamedShape, который принимает радиус и имя в качестве аргументов в их инициализатор. Реализуйте метод area() и метод simpleDescription() класса Circle.
*/

class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return .pi * pow(radius, 2)
    }
    override func simpleDescription() -> String {
        return "Area of circle with radius \(radius) = \(area())."
    }
}
let circle = Circle(radius: 5, name: "My circle")
circle.area()
circle.simpleDescription()
/*
 Задание №2
*/
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    var allCases: [Rank] {
        var values: [Rank] = []
        var index = 1
        while let element = self.init(rawValue: index) {
            values.append(element)
            index += 1
        }
        return values
    }
}

// 1) Напишите функцию, сравнивающую два Rank значения, с помощью сравнения их исходных (raw) значений.

func comparsionResult(_ rank1: Rank, _ rank2: Rank) -> Int {
    if (rank1.rawValue > rank2.rawValue) {
        return 1
    }
    else if (rank1.rawValue < rank2.rawValue) {
        return -1
    }
    else {
        return 0
    }
}

func compareDescription(result: Int) -> String {
    switch result {
    case 1:
        return "Raw value of first rank > Raw value of second rank"
    case -1:
        return "Raw value of first rank < Raw value of second rank"
    case 0:
        return "The same raw value"
    default:
        return "Something strange"
    }
}

let ace = Rank.ace
let jack = Rank.jack

let result = comparsionResult(jack, ace)
let resultDescription = compareDescription(result: result)

// 2) Добавьте метод color() для Suit, который возвращает "black" для spades (пики) и clubs (трефы), и возвращает "red" для hearts (червы) и diamonds (бубны).

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
        func color() -> UIColor {
            switch self {
            case .spades, .clubs:
                return .black
            case .hearts, .diamonds:
                return .red
            }
        }
        var allCases: [Suit] {
            var values: [Suit] = []
            var index = 1
            while let element = self.init(rawValue: index) {
                values.append(element)
                index += 1
            }
            return values
        }
    }
}


let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// 3) Добавьте метод для Card, который бы создал полную колоду карт, с одной картой из каждой комбинации ранга (rank) и масти (suit).
struct Card: Hashable {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func cardsDeck() -> Set <Card> {
        var deck: Set <Card> = []
        for rank in Rank.allCases {
            for suit in Suit.allCases {
                deck.insert(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
