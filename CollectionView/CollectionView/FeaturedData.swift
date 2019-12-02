//
//  FeaturedData.swift
//  CollectionView
//
//  Created by Praful on 02/12/19.
//  Copyright © 2019 Praful. All rights reserved.
//

import UIKit

class FeaturedData: NSObject {
    let id: Int?
    let price: String?
    let imageUrl: String?
    let brandName: String?

    init(id: Int? = nil, price: String? = nil, imageUrl: String? = nil, brandName: String? = nil) {
        self.id = id
        self.price = price
        self.brandName = brandName
        self.imageUrl = imageUrl
    }
}
