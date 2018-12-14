import Foundation
import UIKit

public protocol ViewFromXibProtocol {
    
}

public extension ViewFromXibProtocol where Self: UIView {
    public func xibSetup() {
        let view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.theClassName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.clipsToBounds = true
        return view
    }
}
