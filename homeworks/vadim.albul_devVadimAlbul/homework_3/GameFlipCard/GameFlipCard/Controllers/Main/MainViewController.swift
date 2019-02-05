
import UIKit


class MainViewController: UIViewController {
    
    // MARK: parameters for UI components
    struct CardUIParameters {
        let backColor: UIColor
        let frontColor: UIColor
        let font: UIFont
        let durationTransition: TimeInterval
        let countCardInRow: Int
        
        static var `default`: CardUIParameters {
           return CardUIParameters(backColor: .customBlue,
                                   frontColor: .white,
                                   font: .systemFont(ofSize: 50),
                                   durationTransition: 0.25,
                                   countCardInRow: 2)
        }
    }
    
    struct SizeParameters {
        let marginRow: CGFloat
        let marginSection: CGFloat
        let ratio: CGFloat
        
        static var `default`: SizeParameters {
            return SizeParameters(marginRow: 20,
                                  marginSection: 20,
                                  ratio: 0.75)
        }
    }

    struct FlipCounterParameters {
        let font: UIFont
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let backgroundColor: UIColor
        
        static var `default`: FlipCounterParameters {
            return FlipCounterParameters(font: .systemFont(ofSize: 30, weight: .medium),
                                         textAlignment: .center,
                                         textColor: .black,
                                         backgroundColor: .orange)
        }
    }
    
    // MARK: property
    private let sizeParameters: SizeParameters = .default
    private let cardUIParameters: CardUIParameters = .default
    private let flipCounterParameters: FlipCounterParameters = .default
    private var cardTitles: [String] = ["♥️", "♠️", "♣️", "♥️"]
    private var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    var lblFlipCounter: UILabel!
    var cardButtons: [UIButton] = []
    var cardModels: [CardModel] = []
    
    var flipCount = 0 {
        didSet {
            lblFlipCounter?.text = "Flip: \(flipCount)"
        }
    }
 
    // MARK: life-cycle controller
    override func viewDidLoad() {
        super.viewDidLoad()
        cardTitles.shuffle()
        setupContentUI()
        flipCount = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        updateRectUIContent()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: setup UI items
    fileprivate func setupContentUI() {
        self.view.backgroundColor = .black
        setupFlipCounterLabel()
        setupCards()
        updateRectUIContent()
    }
    
    fileprivate func setupFlipCounterLabel() {
        lblFlipCounter = UILabel(frame: .zero)
        lblFlipCounter.text = nil
        lblFlipCounter.font = flipCounterParameters.font
        lblFlipCounter.textAlignment = flipCounterParameters.textAlignment
        lblFlipCounter.backgroundColor = flipCounterParameters.backgroundColor
        lblFlipCounter.textColor = flipCounterParameters.textColor
        self.view.addSubview(lblFlipCounter)
    }
    
    fileprivate func setupCards() {
        let cardWidth = (screenBounds.width - (CGFloat(cardUIParameters.countCardInRow+1) * sizeParameters.marginRow)) / CGFloat(cardUIParameters.countCardInRow)
        let cardHeight = cardWidth/sizeParameters.ratio
        let sizeCard = CGSize(width: cardWidth, height: cardHeight)
        
        cardTitles.forEach { (title) in
            let model = CardModel(value: title)
            cardModels.append(model)
            
            let cardButton = createCardButton(size: sizeCard)
            self.view.addSubview(cardButton)
            cardButtons.append(cardButton)
            
            updateCard(with: model, on: cardButton)
        }
    }
    
    private func createCardButton(size: CGSize) -> UIButton {
        let button = UIButton(frame: CGRect(origin: .zero, size: size))
        button.titleLabel?.font = cardUIParameters.font
        button.setTitle(nil, for: .normal)
        button.addTarget(self, action: #selector(actionTouchUp), for: .touchUpInside)
        return button
    }
    
    // MARK: target button actions
    @objc func actionTouchUp(button: UIButton) {
        if let index = cardButtons.firstIndex(of: button), cardModels.indices.contains(index) {
            let model = cardModels[index]
            model.toggleCard()
            flipCount += 1
            animationFlipCard(with: model, on: button)
        } else {
            print("Selected card is unknown")
        }
    }
    
    // MARK: update UI items
    private func updateRectUIContent() {
        let screenBounds = UIScreen.main.bounds
        var areaInsets: UIEdgeInsets = .zero
        if #available(iOS 11.0, *) {
            areaInsets = self.view.safeAreaInsets
        }
        
        let labelWidth = screenBounds.width - (sizeParameters.marginRow*2) - areaInsets.left - areaInsets.right
        let heightLabel: CGFloat = max(60, min(labelWidth * 0.25, 100))
        
        lblFlipCounter.frame = CGRect(x: screenBounds.minX + areaInsets.left + sizeParameters.marginRow,
                               y: screenBounds.maxY - heightLabel - (areaInsets.bottom + sizeParameters.marginSection),
                               width: labelWidth,
                               height: heightLabel)
        
        var row = 0
        var section = 0
        cardButtons.forEach { (button) in
            if row >= cardUIParameters.countCardInRow {
                row = 0
                section += 1
            }
            let buttonSize = button.bounds.size
            let positionX = screenBounds.minX + areaInsets.left + (CGFloat(row) * buttonSize.width) + (CGFloat(row+1) * sizeParameters.marginRow)
            let positionY = screenBounds.minY + areaInsets.top + (CGFloat(section) * buttonSize.height) + (CGFloat(section+1) * sizeParameters.marginSection)
            let positon = CGPoint(x: positionX, y: positionY)
            
            button.frame = CGRect(origin: positon, size: buttonSize)
            row += 1
        }
        self.view.layoutIfNeeded()
    }
    
    private func updateCard(with model: CardModel, on button: UIButton) {
        let titleBtn = model.isActive ? model.value : nil
        let color = model.isActive ? self.cardUIParameters.frontColor : self.cardUIParameters.backColor
        button.setTitle(titleBtn, for: .normal)
        button.backgroundColor = color
    }
    
    // MARK: animate chage state
    func animationFlipCard(with model: CardModel, on button: UIButton) {
        UIView.transition(with: button, duration: cardUIParameters.durationTransition,
                          options: .transitionFlipFromRight, animations: {
            self.updateCard(with: model, on: button)
        }, completion: nil)
    }
}

// MARK: -
extension UIColor {
    static let customBlue =  UIColor(red: 0.09, green: 0.73, blue: 0.92, alpha: 1.0)
}
