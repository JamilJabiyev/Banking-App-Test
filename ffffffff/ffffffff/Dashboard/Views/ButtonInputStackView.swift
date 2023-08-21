//
//  ButtonInputStackView.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 16.08.23.
//

import UIKit
import SnapKit

struct ButtonInputStackViewModel {
    let textName: String
    let buttonIcon: IconType
    let buttonAction: (() -> ())?
    
    init(textName: String, buttonIcon: IconType, buttonAction: (()->())? = nil) {
        self.textName = textName
        self.buttonIcon = buttonIcon
        self.buttonAction = buttonAction
    }
}

class ButtonInputStackView: UIView, UITextViewDelegate {
    
    private var buttonAction: (()->())? = nil
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Views
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var viewForButton: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.shadowColor = UIColor.black.cgColor
        //view.layer.shadowColor = UIColor(red: 0.698, green: 0.718, blue: 0.78, alpha: 0.3).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var inputButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = Fonts.style(type: .medium, size: 12)
        return label
    }()
    
    
    //MARK: - Constraints
    
    func configure(_ item: ButtonInputStackViewModel) {
        inputButton.setImage(Icons.getIcon(type: item.buttonIcon), for: .normal)
        labelName.text = item.textName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        stackView.addGestureRecognizer(tapGesture)
        buttonAction = item.buttonAction
    }
   
    
    // MARK: - Private methods
    
    private func setup(){
        
        addSubview(stackView)
        stackView.addArrangedSubview(viewForButton)
        stackView.addArrangedSubview(labelName)
        viewForButton.addSubview(inputButton)
        
        inputButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
                
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewForButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(10)
        }
    }
    
    @objc
    private func didTapButton() {
        buttonAction?()
    }
}









