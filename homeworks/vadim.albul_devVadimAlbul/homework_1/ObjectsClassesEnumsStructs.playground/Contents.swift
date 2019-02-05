import UIKit
import Foundation

// Task #1
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
        return pow(radius, 2) * .pi
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius: \(radius) and area: \(area())"
    }
}

let circle1 = Circle(radius: 10, name: "Circle1")
print(circle1.simpleDescription())


// Task #2
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
    
    func compare(_ rank: Rank) -> String {
        if self.rawValue > rank.rawValue {
            return "Rank \(self.simpleDescription()) is higher than \(rank.simpleDescription())"
        } else if self.rawValue < rank.rawValue {
            return "Rank \(self.simpleDescription()) is less than \(rank.simpleDescription())"
        }
        return "Levels of rank"
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
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    static func createDeckCards() -> [Card] {
        var deckCatds = [Card]()
        Rank.allCases.forEach { rank in
            Suit.allCases.forEach { suit in
                deckCatds.append(Card(rank: rank, suit: suit))
            }
        }
        return deckCatds
    }
}

// compare two rank
print("\n----- Compare two rank ------")
let rank1: Rank = .five
print(rank1.compare(.two))
print(rank1.compare(.five))
print(rank1.compare(.queen))

// create deck of cards
print("\n----- DESK CARDS ------")
let cards = Card.createDeckCards()
cards.forEach {
    print($0.simpleDescription())
}


// Task #3
struct Command {
    var message: String

    
    func execute() {
        print("Command: \(message)")
    }
}

enum Mode {
    case idle, work, error
}

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
            commands.forEach({$0.execute()})
        case .error:
            print("robot is broken")
        }
    }
}

// create an instances of the classes
class Terminator: Robot {
    init() {
        let commands = [
            Command(message: "start processing"),
            Command(message: "say \"I'll be back\""),
            Command(message: "self-destruction")
        ]
        super.init(commands: commands)
    }
}

class Cyborg: Robot {
    init() {
        let commands = [
            Command(message: "start processing"),
            Command(message: "move front and left"),
            Command(message: "open the fire"),
            Command(message: "self-destruction")
        ]
        super.init(commands: commands)
    }
}

class Transformer: Robot {
    init() {
        let commands = [
            Command(message: "transform to car"),
            Command(message: "go to front"),
            Command(message: "transform to airplane"),
            Command(message: "fly up")
        ]
        super.init(commands: commands)
    }
}

class BrokenRobot: Robot {
    init() {
        super.init(commands: [])
    }
}

// create robots
print("\n----- Robot: Terminator ------")
let terminator = Terminator()
terminator.start()
terminator.go()

print("\n----- Robot: Cyborg ------")
let cyborg = Cyborg()
cyborg.start()
cyborg.go()

print("\n----- Robot: Transformer ------")
let transformer = Transformer()
transformer.start()
transformer.go()

print("\n----- Robot: Broken ------")
let brokenRobot = BrokenRobot()
brokenRobot.start()
brokenRobot.go()
