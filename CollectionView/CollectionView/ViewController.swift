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

    let dataModel = DataModel()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataModel.fetchData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataModel.featuredDataDict.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataModel.featuredDataDictCount[section]
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCellCollectionViewCell

        if !self.dataModel.featuredData.isEmpty {
//            let featuredData = self.dataModel.featuredData[indexPath.row]
            let key = self.dataModel.featuredDataDictKey[indexPath.section]

            if let featuredData = self.dataModel.featuredDataDict[key]?[indexPath.row] {
                cell.updateCell(data: featuredData)
            }
        }

        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = sectionInsets.left * (numberOfItemInRow + 1)
        let width = view.frame.width - padding

        return CGSize(width: width / numberOfItemInRow, height: collectionView.cellForItem(at: indexPath)?.frame.height ?? 250)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
            return sectionHeader
        }

        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
