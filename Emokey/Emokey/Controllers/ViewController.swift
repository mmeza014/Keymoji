//
//  ViewController.swift
//  Emokey
//
//  Created by Leila Adaza on 9/15/18.
//  Copyright © 2018 ShellHacks. All rights reserved.
//
import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var passwordsTableView: UITableView!
    
    
    
    var passwords = [CoreDataPassword]()
        
        {
        
        // didset execute everytime product object value as change
        
        didSet{
            
            DispatchQueue.main.async {
                
                self.passwordsTableView.reloadData()
                
            }
            
        }
        
    }
    
    
    
    var password: CoreDataPassword?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        self.passwordsTableView.delegate = self
        
        self.passwordsTableView.dataSource = self
        
        
        
        // remove separators from cells
        
        passwordsTableView.separatorStyle = .none
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        passwordsTableView.reloadData()
        
        self.navigationController?.isNavigationBarHidden = true
        
        super.viewWillAppear(animated)
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        var numOfSections: Int = 1
        
        if passwords.count > 0 {
            
            passwordsTableView.backgroundView = nil
            
        } else {
            
            numOfSections = 0
            
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: passwordsTableView.bounds.size.width * 0.10, height: passwordsTableView.bounds.size.height))
            
            noDataLabel.text = "Your passwords list is empty. Please add some passwords so you can view them here."
            
            noDataLabel.font = UIFont(name: "Georgia", size: 17)
            
            noDataLabel.textColor = UIColor.darkGray
            
            noDataLabel.textAlignment = .center
            
            noDataLabel.numberOfLines = 0
            
            passwordsTableView.backgroundView  = noDataLabel
            
        }
        
        
        
        return numOfSections
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return passwords.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = passwordsTableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PasswordTableViewCell
        
        
        
        let password = passwords[indexPath.row]
        
        cell.password = password
        
        cell.companyTitleLabel.text = password.company
        
        cell.emojiPasswordLabel.text = password.emojiPassword
        
        
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            let password = self.passwords[indexPath.row]
            
            CoreDataHelper.delete(Password: password)
            
            self.passwords.remove(at: indexPath.row)
            
            self.passwordsTableView.reloadData()
            
        }
        
        
        
        return [delete]
        
    }
    
}
