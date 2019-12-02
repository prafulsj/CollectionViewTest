//
//  SectionHeader.swift
//  CollectionView
//
//  Created by Praful on 29/11/19.
//  Copyright © 2019 Praful. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = NSTextAlignment.center
        label.sizeToFit()
        label.text = "HEADER"
        return label
    }()

    override func awakeFromNib() {
        self.backgroundColor = UIColor.cyan

        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true


    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func updateHeader(title: String) {
        label.text = title
        label.sizeToFit()
        self.layoutIfNeeded()
    }
}
