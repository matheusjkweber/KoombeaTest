//
//  ContactTableViewCell.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import Foundation
import UIKit
import SnapKit

final class ContactTableViewCell: UITableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20.0
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
    }
    
    func setup(image: String, title: String, subtitle: String) {
        self.subtitleLabel.text = subtitle
        self.titleLabel.text = title
        setupUI()
        
        if let imageURL = URL(string: image) {
            ImageDownloader.shared.downloadImageFromUrl(url: imageURL, completion: { image in
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            })
        }
    }
    
    private func setupUI() {
        addSubviews()
        makeConstraints()
        selectionStyle = .none
        backgroundColor = .white
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(dividerView)
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16.0)
            make.height.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(16.0)
            make.right.equalTo(-16.0)
            make.top.equalTo(8.0)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8.0)
            make.bottom.equalToSuperview().offset(-8.0)
            make.left.equalTo(16.0)
            make.right.equalTo(-16.0)
            make.height.equalTo(1.0)
        }
    }
}
