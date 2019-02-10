//
//  SecondViewController.swift
//  github
//
//  Created by Dan on 1/20/19.
//  Copyright © 2019 Dan Viitenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var username = ""
    var repo = [Repo]()
    var user: UserRepo?
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var folderLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        updateTable()
        tableView.delegate = self
        tableView.dataSource = self
        updateLabels()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! TableViewCell
        let hedline = repo[indexPath.row]
        cell.repoLabel.text = hedline.name
        cell.starLabel.text = String(hedline.stargazers_count!)
        return cell
    }
    func updateTable(){
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.sync {
        let url = URL(string: "https://api.github.com/users/\(username)/repos")
        let request = NSMutableURLRequest(url: url!)
        URLSession.shared.dataTask(with: request as URLRequest){ (data, response, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            do{
                let json = try JSONDecoder().decode([Repo].self, from: data!)
                json.forEach({(repo) -> Void in
                    DispatchQueue.main.async {
                        self.repo.append(repo)
                        self.tableView.reloadData()
                    }
                })
            }catch let error{
                print(error.localizedDescription)
            }
        }.resume()
     }
    }
    func updateUIView(){
        let url = user?.avatar_url
        let imageURL: URL = URL(string: url!)!
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    self.userImageView.image = UIImage(data: data)
                }
            }
        }
    }
    func updateLabels(){
        fullnameLabel.text = user?.name
        usernameLabel.text = user?.login
        likeLabel.text = String(user!.followers) 
        folderLabel.text = String(user!.public_repos) 
    }
}

