
import UIKit

class GFMainViewController: UIViewController {

    // MARK: property
    var lblFlip: UILabel!
    var cardsCollection: [GFCardModel] = []
    
    var flipCount = 0 {
        didSet {
            lblFlip?.text = "Flip: \(flipCount)"
        }
    }
    var cards: [String] = ["♥️", "♠️", "♣️", "♥️"]
    let backCardColor: UIColor = UIColor(red:0.09, green:0.73, blue:0.92, alpha:1.0)
    let frontCardColor: UIColor = .white
    let countCardInRow: Int = 2
    let marginRow: CGFloat = 20
    let marginSection: CGFloat = 20
    let ratioCard: CGFloat = 0.75

    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cards.shuffle()
        setupContentUI()
        flipCount = 0
    }
    
    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setRectContent()
    }
    
    // MARK: setup functions
    fileprivate func setupContentUI() {
        self.view.backgroundColor = .black
        setupFlipLabel()
        setupCardsCollection()
        setRectContent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupFlipLabel() {
        lblFlip = UILabel(frame: .zero)
        lblFlip.text = nil
        lblFlip.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        lblFlip.textAlignment = .center
        lblFlip.backgroundColor = .orange
        self.view.addSubview(lblFlip)
    }
    
    fileprivate func setupCardsCollection() {
        let screenBounds = UIScreen.main.bounds
        let cardWidth = (screenBounds.width - (CGFloat(countCardInRow+1) * marginRow)) / CGFloat(countCardInRow)
        let cardHeight = cardWidth/ratioCard
        
        let sizeCard = CGSize(width: cardWidth, height: cardHeight)

        cards.forEach { (card) in
            let model = GFCardModel(value: card, size: sizeCard)
            model.delegate = self
            model.set(to: self.view)
            cardsCollection.append(model)
        }
    }
    
    // MARK: set function
    func setRectContent() {
        let screenBounds = UIScreen.main.bounds
        var areaInsets: UIEdgeInsets = .zero
        if #available(iOS 11.0, *) {
            areaInsets = self.view.safeAreaInsets
        }
       
        let labelWidth = screenBounds.width - (marginRow*2) - areaInsets.left - areaInsets.right
        let heightLabel: CGFloat = max(60, min(labelWidth * 0.25,100))
        lblFlip.frame = CGRect(x: screenBounds.minX + areaInsets.left + marginRow, y: screenBounds.maxY - heightLabel - (areaInsets.bottom + marginSection), width: labelWidth, height: heightLabel)
        
        var row = 0
        var section = 0
        cardsCollection.forEach { card in
            if row >= countCardInRow {
                row = 0
                section += 1
            }
            let positionX = screenBounds.minX + areaInsets.left + (CGFloat(row) * card.size.width) + (CGFloat(row+1) * marginRow)
            let positionY = screenBounds.minY + areaInsets.top + (CGFloat(section) * card.size.height) + (CGFloat(section+1) * marginSection)
            card.updatePosition(CGPoint(x: positionX, y: positionY))
            row += 1
        }
        self.view.layoutIfNeeded()
    }
}

// MARK: - extension: GFCardModelDelegate
extension GFMainViewController: GFCardModelDelegate {
    
    func actionCard(_ model: GFCardModel) {
        flipCount += 1
    }
}
