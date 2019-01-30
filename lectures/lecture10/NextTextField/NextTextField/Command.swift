//
//  Command.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 1/27/19.
//  Copyright © 2019 MastersAcademy. All rights reserved.
//

import Foundation

class CommandWith<T>: Codable {
    private let action: (T) -> Void
    
    init(_ action: @escaping (T) -> Void) {
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


