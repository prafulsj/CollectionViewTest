//
//  DataModel.swift
//  CollectionView
//
//  Created by Praful on 02/12/19.
//  Copyright © 2019 Praful. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    let title: String? = nil
    let price: Int? = nil
    let image: UIImage? = nil

    let urlString = "http://staging.bazmashop.com/api/v2/home"

    var featuredData: [FeaturedData] = []

    var featuredDataDict: [String: [FeaturedData]] = [:]

    var featuredDataDictCount: [Int] = []

    var featuredDataDictKey: [String] = []


    func fetchData(completion: (() -> Void)?) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let parsedData = self.jsonToDict(data)
                    self.converDataArrayToReadableData(dataDict: parsedData)
                    completion?()
                } else {
                    print("Error")
                }
            }

            urlSession.resume()
        }
    }

    func jsonToDict(_ data: Data?) -> [String: Any]? {
        var jsonData: [String: Any]? = nil
        if let data = data {
            do {
                jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            } catch let error as NSError {
                print("Data Error: \(error)")
            } catch {
                print("Other")
            }
        }
        return jsonData
    }

    func converDataArrayToReadableData(dataDict: [String: Any]?) {
        let mainData = dataDict?["data"] as? [String:AnyObject]

        for key in mainData!.keys {
            print(key)
            if key == "featured" {
                createdFeaturedData(mainData?[key], key: key)
            } else if key == "best_sellers" {
                createdFeaturedData(mainData?[key], key: key)
            }
        }
    }

    func createdFeaturedData(_ data: AnyObject?, key: String) {
        guard let arrayOfData = data as? [Any] else {
            return
        }

        for featuredData in arrayOfData {
            let featuredDataDict = featuredData as? [String: AnyObject]
            let newFeaturedData = FeaturedData(
                id: featuredDataDict?["id"] as? Int,
                price: featuredDataDict?["final_price"] as? String,
                imageUrl: featuredDataDict?["image"] as? String,
                brandName: featuredDataDict?["name"] as? String)

            self.featuredData.append(newFeaturedData)
        }
        self.featuredDataDict[key] = self.featuredData
        self.featuredDataDictKey.append(key)
        self.featuredDataDictCount.append(self.featuredData.count)
    }

}
