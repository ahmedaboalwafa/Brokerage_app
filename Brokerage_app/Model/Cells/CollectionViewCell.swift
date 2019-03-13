//
//  CollectionViewCell.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/27/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var data: UILabel!
    func setColData(Data : collData){
        title.text = Data.title
        data.text = Data.data
    }
}
