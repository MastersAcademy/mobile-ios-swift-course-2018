import UIKit

// Task №1
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
        return Double.pi * radius * radius
    }
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}
let circle = Circle(radius: 1.0, name: "my circle")
circle.area()
circle.simpleDescription()


// Task №2
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
    
    func compareTo(rank: Rank) -> Int {
        let selfValue = self == .ace ? 14 : self.rawValue
        let rankValue = rank == .ace ? 14 : rank.rawValue
        return selfValue - rankValue
    }
}
Rank.ace.compareTo(rank: .king)
Rank.six.compareTo(rank: .eight)


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
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
print(Suit.clubs.color())

extension Rank: CaseIterable {}
extension Suit: CaseIterable {}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func getDeck() -> Array<Card> {
    var deck = [Card]()
    Rank.allCases.forEach { r in
        Suit.allCases.forEach { s in
            deck.append(Card(rank: r, suit: s))
        }
    }
    return deck
}
getDeck().forEach { print($0.simpleDescription()) }


// Task №3
struct Command {
    var message: String
    func execute() {
        print(message)
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
    func start() -> Robot {
        mode = commands.isEmpty ? .error : .work
        return self
    }
    func go() {
        switch mode {
        case .idle:
            print("robot is off")
        case .error:
            print("robot is broken")
        case .work:
            print("robot is working")
            commands.forEach{$0.execute()}
        }
    }
}

class WarRobot :Robot {
    init() {
        super.init(commands: [Command(message: "assist"),
                              Command(message: "signal"),
                              Command(message: "destroy")])
    }
}
class ExplorerRobot :Robot {
    init() {
        super.init(commands: [Command(message: "explore"),
                              Command(message: "return")])
    }
}
class MechanicRobot :Robot {
    init() {
        super.init(commands: [Command(message: "repair"),
                              Command(message: "check")])
    }
}
class BrokenRobot :Robot {
    init() {
        super.init(commands: [])
        mode = .error
    }
}
WarRobot().start().go()
ExplorerRobot().start().go()
MechanicRobot().start().go()
BrokenRobot().start().go()
BrokenRobot().go()
