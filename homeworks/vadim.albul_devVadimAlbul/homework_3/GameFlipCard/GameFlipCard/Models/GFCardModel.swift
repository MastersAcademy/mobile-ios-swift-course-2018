import Foundation
import UIKit

protocol GFCardModelDelegate: AnyObject {
    func actionCard(_ model: GFCardModel)
}

class GFCardModel {
    
    // MARK: property
    var button: UIButton!
    var value: String

    var backBackgroundColor: UIColor = UIColor(red:0.09, green:0.73, blue:0.92, alpha:1.0)
    let frontBackgroundColor: UIColor = .white
    var font: UIFont =  .systemFont(ofSize: 50)
    weak var delegate: GFCardModelDelegate?
    var durationTransition: TimeInterval = 0.25
    
    var isActive: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    var size: CGSize = .zero {
        didSet {
            button?.frame.size = size
        }
    }
    
    
    // MARK: init
    init(value: String, size: CGSize, isActive: Bool = false) {
        self.value = value
        self.size = size
        setupButton(size: size)
        self.isActive = isActive
    }
    
    // MARK: setup func
    fileprivate func setupButton(size: CGSize) {
        button = UIButton(frame: CGRect(origin: .zero, size: size))
        button.titleLabel?.font = font
        button.setTitle(nil, for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    func set(to view: UIView) {
        view.addSubview(button)
    }
    
    // MARK: update func
    func updatePosition(_ position: CGPoint) {
        button?.frame = CGRect(origin: position, size: size)
        updateButton()
    }
    
    func updateButton(){
        let titleBtn = isActive ? value : nil
        let color = isActive ? frontBackgroundColor : backBackgroundColor
        button?.setTitle(titleBtn, for: .normal)
        button?.backgroundColor = color
    }
    
    // MARK: action
    @objc func actionButton() {
        UIView.transition(with: button, duration: durationTransition, options: .transitionFlipFromRight, animations: {
            self.isActive = !self.isActive
        }, completion: { finished in
            if finished {
                self.delegate?.actionCard(self)
            }
        })
    }
}
