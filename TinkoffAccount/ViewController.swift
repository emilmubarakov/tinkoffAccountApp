//
//  ViewController.swift
//  TinkoffAccount
//
//  Created by e.mubarakov on 16.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(named: "TinkoffBackgroundColor")
            configureAccountView()
        }
    
    func configureAccountView() {
        let accountView = AccountView()
        let infoEur = AccountViewStructure(currency: .eur,
                                   amount: 100,
                                   cardName: "Tinkoff Black EUR",
                                   cards: [CardThumbnailInfo(image: UIImage(named: "card1")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: "")])
        let infoRub = AccountViewStructure(currency: .rub,
                                   amount: 430924,
                                   cardName: "Tinkoff Black Private",
                                   cards: [CardThumbnailInfo(image: UIImage(named: "card1")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: "")])
        let infoUsd = AccountViewStructure(currency: .usd,
                                   amount: 100000,
                                   cardName: "Tinkoff Black USD",
                                   cards: [CardThumbnailInfo(image: UIImage(named: "card1")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: ""),
                                           CardThumbnailInfo(image: UIImage(named: "card2")!, id: "")])
        accountView.configure(with: infoUsd)
        view.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}

