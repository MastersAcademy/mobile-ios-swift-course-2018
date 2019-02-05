import Foundation

extension NSObject {
    
    var theClassName: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
    class func getTheClassName() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
