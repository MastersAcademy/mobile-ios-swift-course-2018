//
//  User.swift
//  FinsGitUser
//
//  Created by Vadim Albul on 1/19/19.
//  Copyright © 2019 Vadim Albul. All rights reserved.
//

import Foundation
import UIKit.UIFont

struct UserProfile: BasicPresentation, Decodable {
    let id: Int
    let login: String
    let name: String?
    let nodeId: String?
    let email: String?
    let company: String?
    let blog: String?
    let location: String?
    let bio: String?
    let hireable: String?
    let avatarURLString: String?
    let publicRepos: Int
    let followers: Int
    
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gitsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    
    var avatarURL: URL? {
        if let urlStr = avatarURLString {
            return URL(string: urlStr)
        }
        return nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case login = "login"
        case name = "name"
        case nodeId = "node_id"
        case email = "email"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case bio = "bio"
        case hireable = "hireable"
        case publicRepos = "public_repos"
        case followers = "followers"
        case avatarURLString = "avatar_url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gitsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
    }
    
    enum ItemKeys: String, CaseIterable {
        case nodeId
        case email
        case company
        case blog
        case location
        case bio
        case hireable
        case htmlURL
        case followersURL
        case followingURL
        case gitsURL
        case starredURL
        case subscriptionsURL
        case organizationsURL
        case reposURL
        case eventsURL
        case receivedEventsURL
        
        var label: String {
            switch self {
            case .nodeId: return "Node ID"
            case .email: return "Email"
            case .company: return "Company"
            case .blog: return "Blog"
            case .location: return "Location"
            case .bio: return "BIO"
            case .hireable: return "Hireable"
            case .htmlURL: return "HTML page url"
            case .followersURL: return "Followers url"
            case .followingURL: return "Following url"
            case .gitsURL: return "Gits page url"
            case .starredURL: return "Starred url"
            case .subscriptionsURL: return "Subscriptions url"
            case .organizationsURL: return "Organizations url"
            case .reposURL: return "Repos url"
            case .eventsURL: return "Events url"
            case .receivedEventsURL: return "Received events url"
            }
        }
    }
    
    var htmlContent: NSAttributedString? {
        let items: [String] = Mirror(reflecting: self).children.compactMap({
            if let labelName = ItemKeys(rawValue: $0.label ?? ""), let value = $0.value as? String {
                return "<b>\(labelName):</b> \(value)"
            }
            return nil
        })
        guard let attr = items.joined(separator: "<br>").toHTMLAttributedString else  {
            return nil
        }
        return attr
    }
    
}
