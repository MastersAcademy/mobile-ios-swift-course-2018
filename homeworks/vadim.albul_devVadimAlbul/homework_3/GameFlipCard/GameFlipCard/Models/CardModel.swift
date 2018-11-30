import Foundation
import UIKit

class CardModel {
    
    // MARK: property
    var value: String
    var isActive: Bool = false

    // MARK: initialize model
    init(value: String) {
        self.value = value
    }
    
    // MARK: model actions
    func toggleCard() {
        self.isActive.toggle()
    }
}
