//
//  ViewController.swift
//  CollectionView
//
//  Created by Praful on 29/11/19.
//  Copyright © 2019 Praful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    private let numberOfItemInRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCellCollectionViewCell

        cell.productImage.backgroundColor = UIColor.cyan
        cell.backgroundColor = UIColor.lightGray

        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = sectionInsets.left * (numberOfItemInRow + 1)
        let width = view.frame.width - padding

        return CGSize(width: width / numberOfItemInRow, height: collectionView.cellForItem(at: indexPath)?.frame.height ?? 250)
    }
}

extension ViewController: UICollectionViewDelegate {

}

