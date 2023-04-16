//
//  AccountView.swift
//  TinkoffAccount
//
//  Created by e.mubarakov on 16.04.2023.
//


import SnapKit
import UIKit

class AccountViewCardCell: UICollectionViewCell {
    // MARK: - Public
    func configure(with image: UIImage) {
        cardImageView.image = image
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Private methods
    
    private func initialize() {
        contentView.addSubview(cardImageView)
        cardImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
