import UIKit

class MainViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet var cardCollection: [UIButton]!
    @IBOutlet weak var lblFlip: UILabel!
    
    // MARK: property
    var flipCount = 0 {
        didSet {
            lblFlip.text = "Flip: \(flipCount)"
        }
    }
    var cards: [String] = ["♥️", "♠️", "♣️", "♥️"]
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        flipCount = 0
        cards = cards.shuffled()
    }
    
    // MARK: IBAction
    @IBAction func clickedCard(_ sender: UIButton) {
        if let index = cardCollection.firstIndex(of: sender), cards.indices.contains(index) {
            flip(button: sender, card: cards[index])
        } else {
            print("Selected card is unknown")
        }
    }
    
    // MARK: func flip button
    func flip(button: UIButton, card: String) {
        let isActive = button.currentTitle == card
        let titleBtn = isActive ? nil : card
        let color = isActive ? UIColor(red:0.09, green:0.73, blue:0.92, alpha:1.0) : .white
        flipCount += 1
        UIView.transition(with: button, duration: 0.25, options: .transitionFlipFromRight, animations: {
            button.setTitle(titleBtn, for: .normal)
            button.backgroundColor = color
        })
    }
}

