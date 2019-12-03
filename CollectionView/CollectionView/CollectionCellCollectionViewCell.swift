//
//  CollectionCellCollectionViewCell.swift
//  CollectionView
//
//  Created by Praful on 29/11/19.
//  Copyright © 2019 Praful. All rights reserved.
//

import UIKit

class CollectionCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!

    var downloadedImage: UIImage? = nil


    func updateCell(data: FeaturedData) {
        title.text = data.brandName
        price.text = data.price

        guard let url = data.imageUrl, let imageUrl = URL(string: url) else {
            return
        }

        if downloadedImage == nil {
            let imageUrlSession = URLSession.shared.dataTask(with: imageUrl) { (data, _, _) in
                if let data = data {
                    self.downloadedImage = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.productImage.image = self.downloadedImage
                    }
                }
            }

            imageUrlSession.resume()
        } else {
            self.productImage.image = self.downloadedImage
        }

    }
}
