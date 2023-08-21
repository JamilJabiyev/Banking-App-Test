//
//  CardCollectionViewCell.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 16.08.23.
//

import UIKit

// array in ichinde cardViewModel olacag

struct CardViewModel {
    let icon: IconType
    let numbers: String
    let date: String
    var balance: Double
    let cardColor: ColorType
}

var cards: [CardViewModel] = [
    CardViewModel.init(icon: .mastercard, numbers: "**** 1234", date: "12/05", balance: 5300.00, cardColor: .primary),
    CardViewModel.init(icon: .mastercard, numbers: "**** 5678", date: "20/03", balance: 5700.00, cardColor: .black),
    CardViewModel.init(icon: .mastercard, numbers: "**** 2468", date: "17/06", balance: 7000.00, cardColor: .gray)
]

//let a = cards[0].balance

final class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.textColor = .white
        label.font = Fonts.style(type: .medium, size: 14)
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let numbersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.style(type: .medium, size: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.style(type: .medium, size: 16)
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.style(type: .semibold, size: 32)
        return label
    }()
    
    func configure(_ item: CardViewModel) {
        logoImageView.image = Icons.getIcon(type: item.icon)
        numbersLabel.text = item.numbers
        dateLabel.text = item.date
        balanceLabel.text = String(item.balance.appendDollar())
        backgroundColor = Colors.getColor(type: item.cardColor)
    }
    
    //private let stackVievHori
    
    
    
    // MARK: - setupUI

    private func setupUI(){
        
        [
        logoImageView,
        numbersLabel,
        dateLabel,
        balanceLabel,
        infoLabel
        ].forEach{addSubview($0)}
        
        logoImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        numbersLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(logoImageView.snp.bottom).offset(31)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(infoLabel.snp.bottom)
        }
    }
    
    
    
    // MARK: - Life Cycle

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

//
//extension Int {
//    func appendDollar() -> String {
//        return "$ \(self)"
//    }
//}
