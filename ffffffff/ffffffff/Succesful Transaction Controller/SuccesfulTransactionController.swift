//
//  SuccesfulTransactionController.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 21.08.23.
//

import UIKit
import SnapKit

class SuccesfulTransactionController: UIViewController {
    
    // MARK: - Views
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.getImage(type: .done)
        return imageView
    }()
    
    private lazy var viewReceiptButton: UIButton = {
        let button = UIButton()
        button.setTitle("View receipt", for: .normal)
        button.setTitleColor(Colors.getColor(type: .primary), for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = Fonts.style(type: .medium, size: 16)
        button.addTarget(self, action: #selector(viewReceiptButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        //button.tintColor = .white
        button.backgroundColor = Colors.getColor(type: .primary)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = Fonts.style(type: .medium, size: 16)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Constraints
    private func setupUI(){
        view.backgroundColor = .white
        
        [
        imageView,
        closeButton,
        viewReceiptButton
        ].forEach(view.addSubview)
        
        UIView.animate(withDuration: 1.0) {
            // Изменяем конечную прозрачность
            self.imageView.alpha = 0.0
            self.imageView.alpha = 1.0
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        viewReceiptButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(closeButton.snp.top).offset(-16)
        }
        
    }
    
    @objc
    func viewReceiptButtonTapped(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    func closeButtonTapped(){
        navigationController?.popToRootViewController(animated: true)
    }
    
}





