//
//  FriendsTableView + Ext.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 17.08.23.
//

import UIKit

extension SendMoneyController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FriendsTableViewCell
        cell.configureTableView(friends[indexPath.row])
        //tableView.rowHeight = 24
        //cell.layer.cornerRadius = 8
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64 // Высота ячейки
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destination = InputDataController()
        let friend = friends[indexPath.row]
        destination.setupInitialData(title: friend.nameSurname, image: Images.getImage(type: friend.profileImage), cardNumber: friend.cardNumber)
        destination.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(destination, animated: true)
    }
}



