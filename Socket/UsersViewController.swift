//
//  UsersViewController.swift
//  SocketChat
//
//  Created by akshay on 04/01/19.
//  Copyright © 2019 akshay. All rights reserved.
//

import UIKit

@IBDesignable class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    //MARK:- IBOutlet Properties
    @IBOutlet weak var tblUserList: UITableView!
    @IBOutlet weak var joinChatBtn: UIButton!
    
    //MARK:- Variables
    var users = [[String : Any]]()
    var nickname : String!
    var configurationOK = false
    
    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !configurationOK {
            configureNavigationBar()
            configureTableView()
            configurationOK = true
        }
    }
    
    // MARK: - Confifure UI
    func configureNavigationBar(){
        self.navigationController?.title = "Socket Chat"
    }
    
    func configureTableView() {
        tblUserList.delegate = self
        tblUserList.dataSource = self
        tblUserList.register(UINib.init(nibName: "UserCell", bundle: Bundle.main), forCellReuseIdentifier: "idCellUser")
        tblUserList.isHidden = true
        tblUserList.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Tableview methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellUser", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "idSegueJoinChat"{
                let chatViewController = segue.destination as! ChatViewController
                chatViewController.nickname = nickname
            }
        }
    }
 

}
