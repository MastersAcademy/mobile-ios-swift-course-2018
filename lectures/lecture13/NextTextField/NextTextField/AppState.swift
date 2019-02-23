//
//  AppState.swift
//  NextTextField
//
//  Created by Igor Kravchenko on 2/19/19.
//  Copyright © 2019 MastersAcademy. All rights reserved.
//

import Foundation

struct AppState {
    let user: User
}

extension AppState {
    static let initial: AppState = AppState(user: .init(name: ""))
}

struct User {
    let name: String
}
