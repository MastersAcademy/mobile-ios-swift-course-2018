import UIKit
// Task 1
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

class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set (value) {
            sideLength = value / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double,name: String) {
        self.radius = radius
        super.init(name: name)
        
    }
    func area() -> Double {
        return Double.pi * pow(radius, 2)
    }
    override func simpleDescription() -> String {
        return "Radius: \(radius) and area: \(area())"
    }
}

let exampleCircle = Circle(radius: 5.0, name: "exCircle")
exampleCircle.area()
exampleCircle.simpleDescription()
print(exampleCircle.simpleDescription())

// Task 2
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

// 2.1
func isRank(_ r1: Rank, r2: Rank) -> Bool{
    return r1.rawValue > r2.rawValue
}
func rankCompare2(r1: Rank, r2: Rank) -> Int{
    if r1.rawValue > r2.rawValue{
        return r1.rawValue
    }else{
        return r2.rawValue
    }
}

// 2.2
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

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
    
//2.3
func fullDeckOfCards() -> [Card]{
    let arrSuits = [Suit.clubs,.diamonds,.hearts,.spades]
    var n = 1
    var arrCards = [Card]()
    while let rank = Rank.init(rawValue: n) {
        for suits in arrSuits{
            arrCards.append(Card(rank: rank, suit: suits))
        }
         n += 1
    }
    return arrCards
}

// Task 3
struct Command{
    var message: String
    func execute() {
        print("Message: \(message)")
    }
}

enum Mode{
    case idle, work, error
}

class Robot{
    var mode: Mode
    var commands: [Command]
    
    init(commands: [Command]) {
        self.commands = commands
        mode = .idle
    }
    func start() {
        if commands.isEmpty{
            mode = .error
        }else {
            mode = .work
        }
    }
    func go(){
        switch mode {
        case .idle:
            print("robot is off")
        case .work:
            print("robot is working")
            for i in commands{
                i.execute()
            }
        case .error:
            print("robot is broken")
        }
    }
}

class Kitt: Robot {
    init() {
        let commands = [
            Command(message: "Go"),
            Command(message: "Left"),
            Command(message: "Right"),
            Command(message: "Stop")]
        super.init(commands: commands)
    }
}

class Mega: Robot {
    init(){
        let commands = [
            Command(message: "Play"),
            Command(message: "Next"),
            Command(message: "Back"),
            Command(message: "Stop")]
        super.init(commands: commands)
    }
}

class Honda: Robot {
    init() {
        let commands = [
            Command(message: "Fire"),
            Command(message: "Open"),
            Command(message: "Close"),
            Command(message: "Stop")]
        super.init(commands: commands)
    }
}

class Broken: Robot{
    init(){
        super.init(commands:[])
    }

}

let kitt = Kitt()
kitt.start()
kitt.go()

let mega = Mega()
mega.start()
mega.go()

let honda = Honda()
honda.start()
honda.go()

let broken = Broken()
broken.start()
broken.go()


