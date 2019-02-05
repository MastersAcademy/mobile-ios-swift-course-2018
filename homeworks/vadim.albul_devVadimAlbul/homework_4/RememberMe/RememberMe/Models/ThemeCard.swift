import Foundation
import UIKit

enum ThemeCard: CaseIterable {
    case smileys
    case animals
    case moon
    case halloween
    case fruits
    case flags
    
    var style: StyleCard {
        switch self {
        case .smileys:
            return StyleCard(frontColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                             backColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),
                             emojiChoices: ["😃", "😂", "😊", "😇", "😉", "😍", "🤪", "🧐", "🤯", "😱"])
        case .animals:
            return StyleCard(frontColor: #colorLiteral(red: 0.7450980544, green: 0.4313012272, blue: 0.7695293382, alpha: 1),
                             backColor: #colorLiteral(red: 0.2588235438, green: 0.6113549471, blue: 0.5443842888, alpha: 1),
                             emojiChoices: ["🐶", "🐱", "🐭", "🦊", "🐻", "🐸", "🐷", "🦁", "🐵", "🐨"])
        case .moon:
            return StyleCard(frontColor: #colorLiteral(red: 0.1271972656, green: 0.3570523172, blue: 0.5651008159, alpha: 1),
                             backColor: #colorLiteral(red: 0.8711971521, green: 0.6786171197, blue: 0.7328331113, alpha: 1),
                             emojiChoices: ["🌝", "🌛", "🌚", "🌖", "🌗", "🌘", "🌜", "🌙", "🌑", "🌓"])
        case .halloween:
            return StyleCard(frontColor: #colorLiteral(red: 0.6641601562, green: 0.8122036844, blue: 0.9724738628, alpha: 1),
                             backColor: #colorLiteral(red: 0.5073797494, green: 0.1470928311, blue: 0.1733881951, alpha: 1),
                             emojiChoices: ["💩", "😈", "👹", "👺", "🤡", "👻", "💀", "👽", "🤖", "🎃"])
        case .fruits:
            return StyleCard(frontColor: #colorLiteral(red: 0.7579211831, green: 0.9353467822, blue: 0.8149352074, alpha: 1),
                             backColor: #colorLiteral(red: 0.3130639196, green: 0.8446777344, blue: 0.6372367382, alpha: 1),
                             emojiChoices: ["🍏", "🍐", "🍋", "🍇", "🍒", "🥥", "🍓", "🥝", "🍌", "🍊"])
        case .flags:
            return StyleCard(frontColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1),
                             backColor: #colorLiteral(red: 0.4373559356, green: 0.5674919664, blue: 1, alpha: 1),
                             emojiChoices: ["🇺🇦", "🇲🇨", "🇧🇷", "🇯🇵", "🇵🇭", "🇧🇾", "🇧🇪", "🇨🇦", "🇮🇱", "🇱🇷"])
        }
    }
}
