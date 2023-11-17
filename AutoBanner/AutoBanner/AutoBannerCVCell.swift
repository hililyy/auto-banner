//
//  AutoBannerCVCell.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/16.
//

import UIKit

class AutoBannerCVCell: UICollectionViewCell {
    
    static let identifier = "AutoBannerCVCell"
    
    let contentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        addSubview(contentsView)
        contentsView.addSubview(imageView)
    }
    
    func initConstraints() {
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
