//
//  Loading.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import UIKit
import SnapKit

open class LoadingView {
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    static let shared = LoadingView()
    
    open func showProgressView(_ view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        
        progressView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.center.equalTo(containerView)
            make.width.height.equalTo(80)
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(progressView)
        }
    }
    
    open func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}
