import UIKit.UIViewController


extension UIViewController {
    
    @inline (__always) func loadViewIfNeeded() {
        if !isViewLoaded { _ = view }
    }
}
