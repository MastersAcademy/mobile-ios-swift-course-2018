import UIKit

/**
 Задание №1
 Из mobile-ios-swift-course-2018/lectures/lecture1/01 - Objects and Classes.playground скопируйте класс NamedShape вместе с родительскими классами в ObjectsClassesEnumsStructs.playground
 Создайте подкласс Circle класса NamedShape, который принимает радиус и имя в качестве аргументов в их инициализатор. Реализуйте метод area() и метод simpleDescription() класса Circle.
*/

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

class Circle: NamedShape {
    
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 2 * .pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with name: \(name) and radius: \(radius)."
    }
}

/**
 Задание №2
 Из mobile-ios-swift-course-2018/lectures/lecture1/02 - Enumerations and Structures.playground скопируйте перечисления Rank, Suit и структуру Card в ObjectsClassesEnumsStructs.playground
 
 Напишите функцию, сравнивающую два Rank значения, с помощью сравнения их исходных (raw) значений.
 Добавьте метод color() для Suit, который возвращает "black" для spades (пики) и clubs (трефы), и возвращает "red" для hearts (червы) и diamonds (бубны).
 Добавьте метод для Card, который бы создал полную колоду карт, с одной картой из каждой комбинации ранга (rank) и масти (suit).
*/

enum Rank: Int, CaseIterable {
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

enum Suit: CaseIterable {
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
        case .diamonds, .hearts:
            return .red
        }
    }
}

struct Card: Hashable {
    
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func deck() -> Set<Card> {
        var deck: Set<Card> = []
        for rank in Rank.allCases {
            for suit in Suit.allCases {
                deck.insert(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}

func areCardRanksTheSame(_ rank1: Rank, _ rank2: Rank) -> Bool {
    return rank1.rawValue == rank2.rawValue
}

/**
 Задание №3
 В ObjectsClassesEnumsStructs.playground создайте:
 
 Струкуру Command с полем message (тип String) и методом execute который в консоль выведет значение поля message
 Перечисление Mode с кейсами idle, work, error
 Класс Robot с
 полями mode (тип Mode), commands (тип массив Command)
 инициализатором с одним аргументом устанавливающим поле commands, и присваивающий полю mode значение idle
 методом start, который в случае, если массив commands пуст, устанавливает в mode значение error, в ином же случае устанавливает в mode значение work
 методом go, который в случае,
 если полю mode присвоено значение idle, выведет в консоль "robot is off",
 если work - "robot is working" и при этом вызовет метод execute у каждого элемента из массива commands,
 если error - "robot is broken"
*/

struct Command {
    
    let message: String
    
    func execute() {
        print(message)
    }
}

enum Mode {
    case idle, work, error
}

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
        case .error:
            print("robot is broken")
        case .work:
            print("robot is working")
            commands.forEach { $0.execute() }
        }
    }
}

/**
 Несколько (3-5) подклассов класса Robot с инициализатором не принимающим аргументов, но передающим массив нескольких (3-5) стуктур Command в инициализатор класса-родителя.
 По одному экземпляру из подклассов класса Robot и вызовите у них методы go, start в таком порядке, чтобы роботы успешно справились с выполнением своих Command-заданий.
*/

class CoffeeRobot: Robot {
    
    init() {
        super.init(commands: [Command(message: "Grind coffee"),
                              Command(message: "Make coffee"),
                              Command(message: "Add shugar"),
                              Command(message: "Drink coffee")])
    }
}

let coffeeRobot = CoffeeRobot()
coffeeRobot.start()
coffeeRobot.go()

class ATM: Robot {
    
    init() {
        super.init(commands: [Command(message: "Get card"),
                              Command(message: "Request pin-code"),
                              Command(message: "Request amount of money"),
                              Command(message: "Give nothing")])
    }
}

let atm = ATM()
atm.start()
atm.go()

class DanceRobot: Robot {
    
    init() {
        super.init(commands: [Command(message: "Dance cha-cha"),
                              Command(message: "Dance hip-hop"),
                              Command(message: "Dance obladi-oblada"),
                              Command(message: "Sleep tight")])
    }
}

let danceRobot = DanceRobot()
danceRobot.start()
danceRobot.go()

class TimeMachine: Robot {
    
    init() {
        super.init(commands: [Command(message: "Open the door"),
                              Command(message: "Request desired time"),
                              Command(message: "Close the door"),
                              Command(message: "Disappear")])
    }
}

let timeMachine = TimeMachine()
timeMachine.start()
timeMachine.go()

class TalkingRobot: Robot {
    
    init() {
        super.init(commands: [Command(message: "Talk about the weather"),
                              Command(message: "Talk about the weather"),
                              Command(message: "Talk about the weather"),
                              Command(message: "Talk about the weather")])
    }
}

let talkingRobot = TalkingRobot()
talkingRobot.start()
talkingRobot.go()

/**
 Подкласс класса Robot, вызов метода go у которого выведет в консоль "robot is broken".
 Экземпляр вышеупомянутого класса и вызовите у него методы для вывода в консоль "robot is broken".
*/

class BrokenRobot: Robot {
    
    init() {
        super.init(commands: [])
        super.start()
    }
}

let brokenRobot = BrokenRobot()
brokenRobot.go()
