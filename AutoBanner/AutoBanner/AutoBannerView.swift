//
//  AutoBannerView.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/16.
//

import UIKit

class AutoBannerView: UIView {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.register(AutoBannerCVCell.self, forCellWithReuseIdentifier: AutoBannerCVCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = .zero
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        initSubView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = .white
    }
    
    private func initSubView() {
        addSubview(collectionView)
    }
    
    private func initConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
