import UIKit

//Task 1
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
let test = Circle(radius: 5.3, name: "my test circle")
test.area()
test.simpleDescription()

//Task 2
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
    func compare(_ rank1: Rank, higherThan rank2: Rank) -> Bool {
        return rank1.rawValue > rank2.rawValue
    }
}


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
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
}

extension Rank: CaseIterable {}
extension Suit: CaseIterable {}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func deck() -> [Card] {
        var deck = [Card]()
        Rank.allCases.forEach { rank in
            Suit.allCases.forEach { suit in
                deck.append(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}

//Task 3
struct Command {
    let message: String
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

class BostonDynamics: Robot {
    init() {
        super.init(commands: [Command(message: "CHEETAH walk"),
                              Command(message: "CHEETAH run"),
                              Command(message: "CHEETAH jump")])
    }
}
let bostonDynamic = BostonDynamics()
bostonDynamic.start()
bostonDynamic.go()

class VacuumCleaner: Robot {
    init() {
        super.init(commands: [Command(message: "Start working"),
                              Command(message: "Clean kitchen"),
                              Command(message: "Clean bedroom"),
                              Command(message: "Going on charger")])
    }
}
let vacuumCleaner = VacuumCleaner()
vacuumCleaner.start()
vacuumCleaner.go()

class Bumblebee: Robot {
    init() {
        super.init(commands: [Command(message: "Say: im Bumblebee"),
                              Command(message: "Say: dont be scared of me"),
                              Command(message: "Transform in car"),
                              Command(message: "Rides"),
                              Command(message: "Transform in robot")])
    }
}
let bumblebee = Bumblebee()
bumblebee.start()
bumblebee.go()

class TestRobot: Robot {
    init() {
        super.init(commands: [])
    }
}
let testRobot = TestRobot()
testRobot.start()
testRobot.go()

