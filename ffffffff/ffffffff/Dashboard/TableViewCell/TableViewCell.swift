////
////  TableView.swift
////  ffffffff
////
////  Created by Jamil Jabiyev on 17.08.23.
////

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    private let nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.style(type: .semibold, size: 14)
        return label
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.style(type: .semibold, size: 14)
        return label
    }()
    
    // MARK: - setupUI
    
    private func setupUI(){
        
        [
            stackView
        ].forEach{addSubview($0)}
        
        [
            profileImage,
            nameSurnameLabel,
            amountLabel
        ].forEach(stackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(12)
        }
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(40)
        }
        
        nameSurnameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        amountLabel.snp.makeConstraints { make in
            //make.centerX.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func configureTransactions(_ item: TransactionDetails){
        nameSurnameLabel.text = item.name
        profileImage.image = item.image
        amountLabel.text = String("- " + item.transerMoney.appendDollar())
    }
}






