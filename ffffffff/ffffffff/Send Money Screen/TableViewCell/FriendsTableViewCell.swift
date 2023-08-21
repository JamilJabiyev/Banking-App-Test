//
//  friendsTableViewCell.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 17.08.23.
//

import UIKit
import SnapKit

struct FriendsTableViewCellModel {
    let nameSurname: String
    let profileImage: ImageTypes
    let cardNumber: String
}

class FriendsTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    private let nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.style(type: .semibold, size: 14)
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goToIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = Icons.getIcon(type: .chevronRight)
        return icon
    }()
    
    func configureTableView(_ item: FriendsTableViewCellModel){
        profileImageView.image = Images.getImage(type: item.profileImage)
        nameSurnameLabel.text = item.nameSurname
        cardNumberLabel.text = item.cardNumber
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Live Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    // MARK: - Constraints
    
    private func setupUI(){
        
        [
            profileImageView,
            nameSurnameLabel,
            goToIcon
        ].forEach{stackView.addArrangedSubview($0)}
        
        [
            stackView
        ].forEach{addSubview($0)}
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(12)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(40)
        }
        
        nameSurnameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        goToIcon.snp.makeConstraints { make in
            //make.centerX.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(24)
        }
        
    }
    
    
}

