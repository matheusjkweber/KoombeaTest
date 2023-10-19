//
//  ListViewController.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import UIKit


final class ContactsListViewController: UIViewController {
    private lazy var mainView = ContactsListView(tableViewDataSourceAndDelegate: viewModel.tableViewDataSourceAndDelegate)
    let viewModel: ContactsListViewModel
    
    init(viewModel: ContactsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        viewModel.delegate = self
        viewModel.loadUsers()
    }
    
    func setupNavigation() {
        self.title = "Favorites"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.isHidden = false
    }
}

extension ContactsListViewController: ContactsListViewModelDelegate {
    func showLoading() {
        LoadingView.shared.showProgressView(mainView)
    }
    
    func hideLoading() {
        LoadingView.shared.hideProgressView()
    }
    
    func reloadData(with users: [UserModel]) {
        mainView.reloadData()
    }
}
