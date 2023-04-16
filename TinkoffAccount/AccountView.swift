//
//  AccountView.swift
//  TinkoffAccount
//
//  Created by e.mubarakov on 16.04.2023.
//

import SnapKit
import UIKit

class AccountView: UIView {
    // MARK: - Public
    func configure(with info: AccountViewStructure) {
        currencySignImageView.image = makeCurrencyImage(for: info.currency)
        amountLabel.text = makeAmountText(for: info.amount, currency: info.currency)
        cardNameLabel.text = info.cardName
        cards = info.cards
        collectionView.reloadData()
    }

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        configureCollectionView()
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private let currencySignImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private let cardNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()

    private var collectionView: UICollectionView!
    private var cards: [CardThumbnailInfo] = []
    
    func configureCollectionView() {
        let layout = makeCollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AccountViewCardCell.self, forCellWithReuseIdentifier: String(describing: AccountViewCardCell.self))
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
    
    func initialize() {
        layer.cornerRadius = 16
        backgroundColor = UIColor(named: "TinkoffThemeColor")
        
        let yStack = UIStackView()
        yStack.axis = .vertical
        yStack.spacing = 4
        yStack.addArrangedSubview(amountLabel)
        yStack.addArrangedSubview(cardNameLabel)
        yStack.setCustomSpacing(12, after: cardNameLabel)
        yStack.addArrangedSubview(collectionView)
        
        let xStack = UIStackView()
        xStack.axis = .horizontal
        xStack.alignment = .top
        xStack.spacing = 16
        currencySignImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        xStack.addArrangedSubview(currencySignImageView)
        xStack.addArrangedSubview(yStack)
        
        addSubview(xStack)
        xStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Private methods
private extension AccountView {

    func makeCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }

    func makeCurrencyImage(for currency: Currency) -> UIImage? {
        switch currency {
        case .eur:
            return UIImage(named: "eur")
        case .usd:
            return UIImage(named: "usd")
        case .rub:
            return UIImage(named: "rub")
        }
//        return UIImage(named: "star")
    }

    func makeAmountText(for amount: Int, currency: Currency) -> String {
        var currencySign: String {
            switch currency {
            case .eur:
                return "€"
            case .usd:
                return "$"
            case .rub:
                return "₽"
            }
        }
        return "\(amount) \(currencySign)"
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension AccountView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AccountViewCardCell.self), for: indexPath) as! AccountViewCardCell
        cell.layer.cornerRadius = 100
        cell.configure(with: cards[indexPath.item].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 45, height: 30)
    }
}
