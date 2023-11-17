//
//  OneView.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/16.
//

import UIKit

class OneView: UIView {
    let banner = AutoBannerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.5
        initalize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initalize() {
        addSubview(banner)
        
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            banner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            banner.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            banner.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
