import Foundation
import UIKit

open class ControlFromXib: UIControl, ViewFromXibProtocol {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupViews()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
    }
    
    open func setupViews() {
    }
}
