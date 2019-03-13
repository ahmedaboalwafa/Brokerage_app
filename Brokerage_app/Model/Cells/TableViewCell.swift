//
//  TableViewCell.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var noData: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    var datacol = [collData]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // collection.delegate = self
       // collection.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    ///////////////////////////// set functions
    
    //if there is data
    func setData(data: SearchedData){
        datacol.removeAll()
        datacol.append(collData(title: "Rate", data: data.Rate!))
        datacol.append(collData(title: "Net Premium", data: data.netpremium!))
        datacol.append(collData(title: "Total Pentium", data: data.totalpentium!))
        datacol.append(collData(title: "Deductable", data: data.deduct!))
        collection.delegate = self
        collection.dataSource = self
        collection.reloadData()
    }
    
    /*
     //if there id data with realm
     func setData3(data: SearchedData){
     datacol.removeAll()
     datacol.append(collData(title: "Rate", data: data.Rate!))
     datacol.append(collData(title: "Net Premium", data: data.netpremium!))
     datacol.append(collData(title: "Total Pentium", data: data.totalpentium!))
     datacol.append(collData(title: "Deductable", data: data.deduct!))
     collection.reloadData()
     }
     */
    
    // if there is no data
    func setlabel(label:String){
        noData.text = label
    }
    
    ////////////////////////// Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.setColData(Data: datacol[indexPath.row])
        return cell
}


}
