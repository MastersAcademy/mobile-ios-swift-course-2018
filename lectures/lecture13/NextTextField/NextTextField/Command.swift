//
//  Command.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 1/27/19.
//  Copyright © 2019 MastersAcademy. All rights reserved.
//

import Foundation

class CommandWith<T>: Codable, Hashable {
    static func == (lhs: CommandWith<T>, rhs: CommandWith<T>) -> Bool {
        return lhs.id == rhs.id
    }
    
    private let action: (T) -> Void
    let id: String
    
    var hashValue: Int {
        return ObjectIdentifier.init(self).hashValue
    }
    
    init(id: String = "", _ action: @escaping (T) -> Void) {
        self.id = id
        self.action = action
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init {_ in }
    }
    
    func encode(to encoder: Encoder) throws {}

    func perform(with value: T) {
        action(value)
    }
    
    static var nop: CommandWith<T> {
        return CommandWith<T> { _ in }
    }
    
    
}

typealias Command = CommandWith<Void>

extension CommandWith where T == Void {
    func perform() {
        perform(with: ())
    }
}


