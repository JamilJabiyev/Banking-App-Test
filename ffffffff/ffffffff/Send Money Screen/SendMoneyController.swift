//
//  SendMoneyController.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 16.08.23.
//

import UIKit

let friends: [FriendsTableViewCellModel] = [
    FriendsTableViewCellModel(nameSurname: "Rebecca Hale", profileImage: .avatar1, cardNumber: "1234 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Olivia Taylor", profileImage: .avatar2, cardNumber: "1134 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Elaine Convington", profileImage: .avatar3, cardNumber: "1334 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Robert Cooper", profileImage: .avatar4, cardNumber: "1434 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Austin Cannon", profileImage: .avatar5, cardNumber: "1534 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Nadia Page", profileImage: .avatar6, cardNumber: "1634 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Donald Waters", profileImage: .avatar7, cardNumber: "1734 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Wayne Alvarado", profileImage: .avatar8, cardNumber: "1834 **** **** 5678"),
    FriendsTableViewCellModel(nameSurname: "Maria Charles", profileImage: .avatar9, cardNumber: "1934 **** **** 5678"),
]

class SendMoneyController: UIViewController {
    
    let cellIdentifier = "Cell"
    

    
    //MARK: - Views
    
    
    
    // MARK: - Table View
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Search Bar
    
    private let searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "Write name, phone or card number"
        searchbar.layer.cornerRadius = 12
        searchbar.backgroundColor = Colors.getColor(type: .lightGray)
        return searchbar
    }()
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Send money to"
        setupTableViewAndSearchBar()
        setupUI()
    }
    
    //MARK: - Constraints
    
    private func setupTableViewAndSearchBar(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        searchBar.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func setupUI(){
        //view.backgroundColor = Colors.getColor(type: .backgroundColorView)
        view.backgroundColor = .white
        
        [
            tableView,
            searchBar
        ].forEach{view.addSubview($0)}
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
    }
}

