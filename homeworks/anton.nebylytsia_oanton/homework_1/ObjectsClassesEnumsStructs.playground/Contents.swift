import UIKit

// MARK: Task 1
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
    
    init(radius:Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * pow(radius, 2)
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}

var circle = Circle(radius: 3, name: "Circle")
circle.area()
circle.simpleDescription()

// MARK: Task 2
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

    // subtask 2.1
    func isEqual(to aRank: Rank) -> Bool {
        return self.rawValue == aRank.rawValue
    }
}

Rank.ace.isEqual(to: .ace)
Rank.ace.isEqual(to: .two)

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

    // subtask 2.2
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

Suit.clubs.color()
Suit.hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // subtask 2.3
    static func fullDeckOfCards() -> [Card] {
        var cards: [Card] = []
        for rank in Rank.allCases {
            for suit in Suit.allCases {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        return cards
    }
}

Card.fullDeckOfCards().forEach { print($0.simpleDescription()) }


// MARK: Task 3

// subtask 3.1
struct Command {
    let message: String
    func execute() {
        print(message)
    }
}

// subtask 3.2
enum Mode {
    case idle, work, error
}

// subtask 3.3
class Robot {
    var mode: Mode
    var commands: [Command]
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
            commands.forEach { $0.execute() }
        case .error:
            print("robot is broken")
        }
    }
}

class Daisy: Robot {
    init() {
        super.init(commands: [Command(message: "Take"),
                              Command(message: "Turn"),
                              Command(message: "Disassemble"),
                              ])
    }
}

class Droid: Robot {
    init() {
        let commands = [
            Command(message: "Go"),
            Command(message: "Left"),
            Command(message: "Right"),
            Command(message: "Stop")]
        super.init(commands: commands);
    }
}

class BigDog: Robot {
    init() {
        super.init(commands: [Command(message: "Follow"),
                              Command(message: "Сrouch"),
                              Command(message: "Run"),
                              ])
    }
}

// subtask 3.3

var daisyRobot = Daisy()
daisyRobot.start()
daisyRobot.go()

var droidRobot = Droid()
droidRobot.start()
droidRobot.go()

var bigDogRobot = BigDog()
bigDogRobot.start()
bigDogRobot.go()


// subtask 3.4
class Broken: Robot {
    init(){
        super.init(commands:[])
    }
}

// subtask 3.5
var brokenRobot = Broken()
brokenRobot.start()
brokenRobot.go()
