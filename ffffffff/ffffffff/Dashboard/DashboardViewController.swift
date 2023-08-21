//
//  ViewController.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 13.08.23.
//

import UIKit
import SnapKit


class DashboardViewController: UIViewController {
    
    var transactionsArray: [TransactionDetails] = TransactionManager.shared.list
    let cardCellIdentifier = "CardCell"
    let historyCell = "HistoryCell"
    let refreshControl = UIRefreshControl()
    
    // MARK: - Views
    
    private let myAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "My accounts"
        label.font = Fonts.style(type: .semibold, size: 24)
        label.textColor = Colors.getColor(type: .black)
        return label
    }()
    
    private let notificationsButton: UIButton = {
        let button = UIButton()
        button.setImage(Icons.getIcon(type: .alert), for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let topUpButton: ButtonInputStackView = {
        let button = ButtonInputStackView()
        button.configure(.init(textName: "Top up", buttonIcon: IconType.payment))
        return button
    }()
    
    private let payButton: ButtonInputStackView = {
        let button = ButtonInputStackView()
        button.configure(.init(textName: "Pay", buttonIcon: IconType.receipt))
        return button
    }()
    
    private lazy var sendButton: ButtonInputStackView = {
        let button = ButtonInputStackView()
        button.configure(.init(textName: "Send", buttonIcon: IconType.send, buttonAction: { [weak self] in
            self?.sendButtonTapped()
        }))
        return button
    }()
    
    private let moreButton: ButtonInputStackView = {
        let button = ButtonInputStackView()
        button.configure(.init(textName: "More", buttonIcon: IconType.table))
        return button
    }()
    
    
    let transactionsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        //view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowColor = UIColor(red: 0.698, green: 0.718, blue: 0.78, alpha: 0.3).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 15
        return view
    }()
    
    private let homeIndicatorButton: UIButton = {
        let button = UIButton()
        button.setImage(Icons.getIcon(type: .homeIndicator), for: .normal)
        return button
    }()
    
    private var tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
//    private lazy var tapGesture = UIGestureRecognizer(target: self, action: #selector(sendTap(_:)))
//
//    @objc
//    func sendTap(_ sender: UITapGestureRecognizer){
//        navigationController?.pushViewController(SendMoneyController(), animated: true)
//    }
    
    private var isExpanded = false
    
    private var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        setupUI()
        setupInteractionView()
        transactionComplete()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        transactionsArray = TransactionManager.shared.list
        tableView.reloadData()
    }

    // MARK: - Constraints
    
    private func setupInteractionView(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        homeIndicatorButton.addGestureRecognizer(tapGesture)
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cardCellIdentifier)
        tableView.separatorStyle = .none
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: cardCellIdentifier)
        collectionView.backgroundColor = Colors.getColor(type: .backgroundColorView)
        collectionView.showsHorizontalScrollIndicator = false
        //collectionView.layer.cornerRadius = 16
    }
    
    private func setupUI(){
        
        [
            topUpButton,
            payButton,
            sendButton,
            moreButton
        ].forEach{stackView.addArrangedSubview($0)}
        
        //sendButton.addGestureRecognizer(tapGesture)
        
        [
            myAccountLabel,
            notificationsButton,
            stackView,
            collectionView,
            transactionsView
        ].forEach{view.addSubview($0)}
        
        [
        homeIndicatorButton,
        tableView
        ].forEach{transactionsView.addSubview($0)}
        
        transactionsView.addSubview(homeIndicatorButton)
        
        myAccountLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        notificationsButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            //make.trailing.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(collectionView.snp.bottom).offset(48)
            make.height.equalTo(90)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(myAccountLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(168)
        }
        
        transactionsView.snp.makeConstraints { make in
            //make.height.equalTo(20)
            make.top.equalTo(stackView.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        homeIndicatorButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
    }
    
    private func sendButtonTapped() {
        let goToNextScreen = SendMoneyController()
        navigationController?.pushViewController(goToNextScreen, animated: true)
    }
    
    private func transactionComplete(){
        let inputDataController = InputDataController()
        inputDataController.onTransactionComplete = {
            // Обновляем представление DashboardViewController
            self.view.setNeedsDisplay()
        }
    }
    
    @objc
    func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        transactionsArray = TransactionManager.shared.list
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc
    func handleTap() {
        isExpanded.toggle()
        
        self.transactionsView.snp.removeConstraints() // Удаляем старые ограничения
        
        if self.isExpanded {
            self.transactionsView.snp.makeConstraints { make in
                make.top.equalTo(self.myAccountLabel.snp.top)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        } else {
            self.transactionsView.snp.makeConstraints { make in
                make.top.equalTo(self.stackView.snp.bottom).offset(48)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
        // Анимируем обновление макета
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cardCellIdentifier, for: indexPath) as! TableViewCell
        //cell.configureTransactions(transactionsArray[indexPath.row])
        //transactionsArray[indexPath.row] = cell
        //tableView.rowHeight = 24
        
        // Проверяем, что индекс находится в пределах массива
            if indexPath.row < transactionsArray.count {
                cell.configureTransactions(transactionsArray[indexPath.row])
                
            }
        
        return cell
    }
}
