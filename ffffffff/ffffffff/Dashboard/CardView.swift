////
////  CardView.swift
////  ffffffff
////
////  Created by Jamil Jabiyev on 16.08.23.
////
//
//import UIKit
//import SnapKit
//
//struct CardViewModel {
//    let balance: Int
//    let cardColor: Colors
//}
//
//class CardView: UIView {
//
//    //MARK: - Life Cycle
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        //setup()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //MARK: - Construction textField
//
//    private lazy var viewForCard: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 16
//        return view
//    }()
//
//    private lazy var labelName2: UILabel = {
//        let label = UILabel()
//        label.image
//        return label
//    }()
//
//
//    private lazy var inputButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .white
//        return button
//    }()
//
//    private lazy var labelName: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.textColor = .black
//        label.font = Fonts.style(type: .medium, size: 12)
//        return label
//    }()
//
//    func configure(_ item: ButtonInputStackViewModel) {
//        inputButton.setImage(Icons.getIcon(type: item.buttonIcon), for: .normal)
//        labelName.text = item.textName
//    }
//
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        return stackView
//    }()
//
//    //MARK: - Constraints
//
//    func setup(){
//
//        addSubview(stackView)
//        stackView.addArrangedSubview(viewForButton)
//        stackView.addArrangedSubview(labelName)
//        viewForButton.addSubview(inputButton)
//
//        inputButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
//
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//
//
//
//
//
//
//
//
//
//
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
