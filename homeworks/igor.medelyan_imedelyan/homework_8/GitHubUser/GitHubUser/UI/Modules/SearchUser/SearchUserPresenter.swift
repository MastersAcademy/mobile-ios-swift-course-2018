//
//  SearchUserPresenter.swift
//  GitHubUser
//
//  Created by Igor Medelyan on 1/25/19.
//  Copyright © 2019 imedelyan. All rights reserved.
//

import UIKit
import Moya
import PromiseKit

class SearchUserPresenter {
    
    // MARK: - Variables
    private var view: SearchUserViewController
    private let api = MoyaProvider<GitHubUserAPI>()
    private var gitHubUser: GitHubUser?
    
    // MARK: - Init
    init(with view: SearchUserViewController) {
        self.view = view
    }
    
    // MARK: - View iteractions
    func getInfo(for username: String) {
        view.show(errorMessage: nil)
        view.setLoading(hidden: false)
        api.request(.getUserInfo(username: username))
            .decode(to: GitHubUser.self)
            .then { [weak self] user -> Promise<[Repository]> in
                self?.gitHubUser = user
                return self?.api.request(.getRepositories(username: username))
                    .decode(to: [Repository].self) ?? Promise<[Repository]>.value([])
            }.done { [weak self] repositories in
                if let user = self?.gitHubUser {
                    self?.view.navigateToUserProfileScreen(user: user, repositories: repositories)
                }
            }.catch { [weak self] error in
                self?.view.show(errorMessage: "Couldn't find info for user")
            }.finally { [weak self] in
                self?.view.setLoading(hidden: true)
        }
    }
}
