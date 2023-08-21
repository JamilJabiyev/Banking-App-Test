//
//  InputDataController.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 17.08.23.
//

import UIKit
import SnapKit

struct TransactionDetails {
    var image: UIImage?
    var name: String
    var transerMoney: Double
}

final class InputDataController: UIViewController {
    
    //MARK: - Views
    
    var onTransactionComplete: (() -> Void)?
    
    private let profileImageInput: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameSurnameLabelInput: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.style(type: .semibold, size: 16)
        return label
    }()
    
    private let cardNumberLabelInput: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.style(type: .regular, size: 12)
        label.textColor = Colors.getColor(type: .gray)
        return label
    }()
    
    private let stackViewInput: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var inputMoney: UITextField = {
        let text = UITextField()
        text.placeholder = "0,00"
        text.keyboardType = .decimalPad
        text.font = Fonts.style(type: .semibold, size: 32)
        text.addTarget(self, action: #selector(inputMoneyChanged), for: .editingChanged)
        return text
    }()
    
    private let feeOrNotFeeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.style(type: .regular, size: 12)
        label.textColor = Colors.getColor(type: .gray)
        return label
    }()
    
    private let selectYourAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your account"
        label.font = Fonts.style(type: .regular, size: 14)
        label.textColor = Colors.getColor(type: .gray)
        return label
    }()
    
    private lazy var wrapperTextField: UITextField = {
        let textField = UITextField()
        textField.inputAccessoryView  = pickerView
        textField.inputAccessoryView = toolbar
        textField.tintColor = .clear
        textField.inputView = pickerView
        return textField
    }()
    
    private lazy var baseStackView: UIStackView = {
        let stack = UIStackView()
        stack.layer.shadowColor = UIColor(red: 0.698, green: 0.718, blue: 0.78, alpha: 0.3).cgColor
        stack.layer.shadowOpacity = 1
        stack.layer.shadowOffset = CGSize(width: 0, height: 2)
        stack.layer.shadowRadius = 15
        stack.layer.cornerRadius = 12
        stack.backgroundColor = .white
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.isUserInteractionEnabled = false
        return stack
    }()
    
    private let visaOrMastercardLogoImage: UIImageView = {
        let image = UIImageView()
        // silersen
        image.image = Icons.getIcon(type: cards[0].icon)
        //        image.image = Icons.getIcon(type: .mastercard)
        return image
    }()
    
    private let detailStackInsideStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.style(type: .semibold, size: 14)
        // silersen
        label.text = cards[0].numbers
        //        label.text = "**** 1234"
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        // silersen
        label.text = String(cards[0].balance)
        label.font = Fonts.style(type: .medium, size: 12)
        label.textColor = Colors.getColor(type: .gray)
        return label
    }()
    
    private lazy var showPickerButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(showPickerButtonTapped), for: .touchUpInside)
        button.setImage(Icons.getIcon(type: .chevron), for: .normal)
        return button
    }()
    
    private lazy var pickerView: UIPickerView = {
        let view = UIPickerView(frame: .zero)
        view.layer.cornerRadius = 16
        //view.backgroundColor = .yellow
        
        view.delegate = self
        view.dataSource = self
        //view.addSubview(toolbar)
        //view.inputAccessoryView = toolbar
        return view
    }()
    
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: true)
        //wrapperTextField.inputView = toolbar
        return toolbar
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Colors.getColor(type: .primary)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = Fonts.style(type: .medium, size: 16)
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    //MARK: - Constraints
    
    private func setupUI(){
        
        view.backgroundColor = .white
        
        wrapperTextField.addSubview(baseStackView)
        
        baseStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [
            profileImageInput,
            nameSurnameLabelInput,
            cardNumberLabelInput
        ].forEach{stackViewInput.addArrangedSubview($0)}
        
        [
            stackViewInput,
            inputMoney,
            feeOrNotFeeLabel,
            selectYourAccountLabel,
            wrapperTextField,
            showPickerButton,
            sendButton
        ].forEach(view.addSubview)
        
        stackViewInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(64)
        }
        
        stackViewInput.setCustomSpacing(0, after: nameSurnameLabelInput)
        //baseStackView.setCustomSpacing(0, after: nameSurnameLabelInput)
        
        [
            visaOrMastercardLogoImage,
            detailStackInsideStack,
            showPickerButton
        ].forEach{baseStackView.addArrangedSubview($0)}
        
        [
            cardNumberLabel,
            balanceLabel
        ].forEach(detailStackInsideStack.addArrangedSubview)
        
        profileImageInput.snp.makeConstraints { make in
            make.size.equalTo(64)
        }
        
        inputMoney.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackViewInput.snp.bottom).offset(32)
        }
        
        feeOrNotFeeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(inputMoney.snp.bottom)
        }
        
        selectYourAccountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(feeOrNotFeeLabel.snp.bottom).offset(32)
        }
        
        wrapperTextField.snp.makeConstraints { make in
            make.height.equalTo(72)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(selectYourAccountLabel.snp.bottom).offset(16)
        }
        
        visaOrMastercardLogoImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            //make.top.equalToSuperview().offset(16)
            //make.bottom.equalToSuperview().offset(16)
            make.height.equalTo(24)
            make.width.equalTo(45)
        }
        
        detailStackInsideStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(visaOrMastercardLogoImage.snp.trailing).offset(16)
        }
        //
        showPickerButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(16)
        }
        
        sendButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    
    func setupInitialData(title: String, image: UIImage?, cardNumber: String) {
        self.nameSurnameLabelInput.text = title
        self.profileImageInput.image = image
        self.cardNumberLabelInput.text = cardNumber
    }
    
    
    @objc
    private func inputMoneyChanged() {
        if let inputText = inputMoney.text, let inputValue = Double(inputText), inputValue > 0 {
            feeOrNotFeeLabel.text = "No fee"
        } else {
            feeOrNotFeeLabel.text = ""
        }
    }
    
    @objc func showPickerButtonTapped() {
    }
    
    @objc func cancelButtonTapped() {
        wrapperTextField.endEditing(true)
    }
    
    
    @objc func doneButtonTapped() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedValue = cards[selectedRow]
        print("Done нажат. Выбрано: \(selectedValue)")
        wrapperTextField.endEditing(true)
        balanceLabel.text = "\(selectedValue.balance)"
        cardNumberLabel.text = "\(selectedValue.numbers)"
        visaOrMastercardLogoImage.image = Icons.getIcon(type: selectedValue.icon)
    }
    
    @objc
    func sendButtonTapped(){
//        navigationController?.pushViewController(SuccesfulTransactionController(), animated: true)
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        var selectedValue = cards[selectedRow]
        
        if let inputText = inputMoney.text, let amount = Double(inputText) {
            if amount <= selectedValue.balance {
                selectedValue.balance -= amount
                cards[selectedRow].balance = selectedValue.balance
                navigationController?.pushViewController(SuccesfulTransactionController(), animated: true)
                print("Updated sum: \(selectedValue.balance)")
//                self.view.setNeedsDisplay()
                onTransactionComplete?()
                //transactionsArray.append(amount)
                TransactionManager.shared.addItem(TransactionDetails(image: profileImageInput.image!, name: nameSurnameLabelInput.text!, transerMoney: amount))
                
                //print("elements was added in \(transactionsArray)")
            } else {
                feeOrNotFeeLabel.textColor = .red
                feeOrNotFeeLabel.text = "Insufficient balance"
                print("Insufficient balance")
            }
        } else {
            feeOrNotFeeLabel.text = "Invalid input"
            print("Invalid input")
        }
        
        // Очистите поле после нажатия кнопки
        inputMoney.text = ""
    }
    
    private func configure(item: TransactionDetails){
        nameSurnameLabelInput.text = item.name
        profileImageInput.image = item.image
        
        
    }

}

extension InputDataController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cards.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(cards[row].balance) + ": - " + cards[row].numbers // Отображаем номера карт в строках пикера
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        balanceLabel.text = cards[row].balance.asString
        cardNumberLabel.text = cards[row].numbers
        visaOrMastercardLogoImage.image = Icons.getIcon(type: cards[row].icon)
    }
}

extension Double {
    var asString: String {
        return "\(self)"
    }
}
