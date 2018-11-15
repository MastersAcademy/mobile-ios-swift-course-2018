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

/*
 Задание №1
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
    }
    func color() -> UIColor {
        switch self {
        case .spades, .clubs:
            return .black
        case .hearts, .diamonds:
            return .red
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(hearts.color().cgColor)

// 3) Добавьте метод для Card, который бы создал полную колоду карт, с одной картой из каждой комбинации ранга (rank) и масти (suit).

extension Rank: CaseIterable {}
extension Suit: CaseIterable {}

struct Card: Hashable {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func deck() -> Set <Card> {
        var deck: Set <Card> = []
        Rank.allCases.forEach { rank in
            Suit.allCases.forEach { suit in
                deck.insert(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

/*
 Задание №3
 В ObjectsClassesEnumsStructs.playground создайте:
 */

// 1) Струкуру Command с полем message (тип String) и методом execute который в консоль выведет значение поля message

struct Command {
    var message: String
    func execute() {
        print(message)
    }
}

// 2) Перечисление Mode с кейсами idle, work, error

enum Mode {
    case idle, work, error
}

/*
 3) Класс Robot с
 полями mode (тип Mode), commands (тип массив Command)
 инициализатором с одним аргументом устанавливающим поле commands, и присваивающий полю mode значение idle
 методом start, который в случае, если массив commands пуст, устанавливает в mode значение error, в ином же случае устанавливает в mode значение work
 методом go, который в случае,
 если полю mode присвоено значение idle, выведет в консоль "robot is off",
 если work - "robot is working" и при этом вызовет метод execute у каждого элемента из массива commands,
 если error - "robot is broken"
 */

class Robot {
    var mode: Mode
    let commands: [Command]
    
    init(commands: [Command]) {
        self.commands = commands
        self.mode = .idle
    }
    
    func start() {
        mode = commands.isEmpty ? .error : .work
    }
    
    func go() {
        switch mode {
        case .idle:
            print("robot is off")
        case .work:
            print("robot is working")
            commands.forEach {commands in commands.execute()}
        case .error:
            print("robot is broken")
        }
    }
}

/*
 4) Несколько (3-5) подклассов класса Robot с инициализатором не принимающим аргументов, но передающим массив нескольких (3-5) стуктур Command в инициализатор класса-родителя.
 5) По одному экземпляру из подклассов класса Robot и вызовите у них методы go, start в таком порядке, чтобы роботы успешно справились с выполнением своих Command-заданий.
 */

class Terminator: Robot {
    init() {
        super.init(commands: [Command(message: "Find Sarah J. Connor"),
                              Command(message: "Kill Sarah J. Connor"),
                              Command(message: "Get back to the future")])
    }
}

let terminator = Terminator()
terminator.start()
terminator.go()

class CoffeMachine: Robot {
    init() {
        super.init(commands: [Command(message: "Malfunction testing"),
                              Command(message: "Grinding coffee beans"),
                              Command(message: "Making coffee")])
    }
}

let coffeMachine = CoffeMachine()
coffeMachine.start()
coffeMachine.go()

class RoboticVacuumCleaner: Robot {
    init() {
        super.init(commands: [Command(message: "Find garbage"),
                              Command(message: "Suck it up"),
                              Command(message: "Repeat")])
    }
}

let vacuumCleaner = RoboticVacuumCleaner()
vacuumCleaner.start()
vacuumCleaner.go()

/*
 6) Подкласс класса Robot, вызов метода go у которого выведет в консоль "robot is broken".
 7) Экземпляр вышеупомянутого класса и вызовите у него методы для вывода в консоль "robot is broken".
 */

class SimpleRobot: Robot {
    init() {
        super.init(commands: [])
    }
}

let simpleRobot = SimpleRobot()
simpleRobot.start()
simpleRobot.go()




