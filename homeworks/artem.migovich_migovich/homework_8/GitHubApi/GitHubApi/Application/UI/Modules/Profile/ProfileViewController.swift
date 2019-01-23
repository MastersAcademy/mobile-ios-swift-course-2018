//
//  ProfileViewController.swift
//  GitHubApi
//
//  Created by Myhovych on 1/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followersImageView: UIImageView!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var repositoriesCountLabel: UILabel!
    @IBOutlet weak var repositoriesImageView: UIImageView!
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    public var username = String()
    private var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set images
        followersImageView.image = UIImage(named: "like")
        invertedImage(imageView: followersImageView)
        repositoriesImageView.image = UIImage(named: "folder")
        invertedImage(imageView: repositoriesImageView)
        // Set labels
        usernameLabel.text = username.capitalized
        //JSON parse
        profileParser()
        reposParser()
        //Register table cell
        let identifier = UINib.init(nibName: Identifier.RepoTableViewCell, bundle: nil)
        self.repositoriesTableView.register(identifier, forCellReuseIdentifier: Identifier.RepoTableViewCell)
        
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func profileParser() {
        let urlString = "https://api.github.com/users/\(username)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let profile = try JSONDecoder().decode(Profile.self, from: data)
                DispatchQueue.main.async {
                    self.profilePictureImageView.downloaded(from: profile.profilePicture)
                    self.fullnameLabel.text = profile.fullName
                    if profile.publicRepositories != nil {
                        self.repositoriesCountLabel.text = String(profile.publicRepositories!)
                    } else { return }
                    if profile.followers != nil {
                        self.followersCountLabel.text = String(profile.followers!)
                    } else { return }
                   // self.followersCountLabel.text = String(profile.followers)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func reposParser() {
        let urlString = "https://api.github.com/users/\(username)/repos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let downloadedRepositories = try JSONDecoder().decode([Repository].self, from: data)
                self.repositories = downloadedRepositories
                DispatchQueue.main.async {
                    self.repositoriesTableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = self.repositoriesTableView.dequeueReusableCell(withIdentifier: Identifier.RepoTableViewCell, for: indexPath) as! RepoTableViewCell
        // set the text from the data model
        cell.repoNameLabel.text = repositories[indexPath.row].name
        cell.starsCountLabel.text = "\(repositories[indexPath.row].starsCount!)"
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
