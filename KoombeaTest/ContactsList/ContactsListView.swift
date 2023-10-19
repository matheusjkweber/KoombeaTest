//
//  ContactsListView.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import UIKit
import SnapKit

class ContactsListView: UIView {
    fileprivate lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.separatorStyle = .none
        tb.rowHeight = UITableView.automaticDimension
        tb.estimatedRowHeight = 120
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.isUserInteractionEnabled = true
        tb.backgroundColor = .white
        tb.sectionHeaderHeight = 28.0
        tb.sectionFooterHeight = 0.0001
        tb.separatorStyle = .none
        return tb
    }()
    
    init(tableViewDataSourceAndDelegate: ContactsListTableViewDataSourceAndDelegate) {
        super.init(frame: CGRect.zero)
        setupView()
        setupLayout()
        addConfigurations()
        
        self.tableView.delegate = tableViewDataSourceAndDelegate
        self.tableView.dataSource = tableViewDataSourceAndDelegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    private func setupView() {
        addSubview(tableView)
    }
    
    private func addConfigurations() {
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: CGFloat.leastNormalMagnitude))
        self.backgroundColor = .white
        registerCells()
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    func reloadData() {
        tableView.reloadData()
    }
    
    
    private func registerCells() {
        tableView.registerCell(ContactTableViewCell.self)
    }
}
