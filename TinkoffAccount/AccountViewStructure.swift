//
//  AccountViewInfo.swift
//  TinkoffAccount
//
//  Created by e.mubarakov on 16.04.2023.
//

import UIKit

struct AccountViewStructure {
    let currency: Currency
    let amount: Int
    let cardName: String
    let cards: [CardThumbnailInfo]
}

enum Currency {
    case rub
    case usd
    case eur
}

struct CardThumbnailInfo {
    let image: UIImage
    let id: String
}
