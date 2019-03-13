//
//  SearchViewController.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import UIKit
import RealmSwift
class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var Data : Results<NewData>!
    var notifier : NotificationToken!
    //deinit { notifier.invalidate() }
    
    var price : Double?
    var data : [SearchedData]?
    var sentData = [SearchedData]()
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.estimatedRowHeight = 104.0
        TableView.delegate = self
        TableView.dataSource = self
       // LoadData()
       // ConvertLoadedData()
    }
    
     /////////////////////////////load data
    
    // load Data
    func LoadData(){
        let realm = try! Realm()
        self.Data = realm.objects(NewData.self).filter("><")
        self.notifier = self.Data.observe{(results) in
            switch results {
            case .error(let error): print(error)
            case .initial(_): self.TableView.reloadData()
            case .update(_, deletions: _, insertions: _, modifications: _) : self.TableView.reloadData()
            }
        }
    }
    
    // convert loaded data
    func ConvertLoadedData(){
        for i in 0...(Data!.count-1) {
            sentData.append(SearchedData(Rate: String(Data[i].Payment), netpremium: String((price! * Data[i].Payment)), totalpentium: String((price! * Data[i].Payment)), deduct: String(Data[i].MiniFees)))
        }
    }
    
    ////////////////////////////Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data!.count == 0{
            return 1
        }else{return (data!.count)}
        //return Data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data!.count == 0{
            let cell = TableView.dequeueReusableCell(withIdentifier: "nodata", for: indexPath) as! TableViewCell
            cell.setlabel(label: "No Data")
            return cell
        }else{
            
            let cell = TableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as! TableViewCell
                cell.setData(data: data![indexPath.row] )
                //cell.setData3(data: sentData![indexPath.row] )
                return cell
        }
    }
    
   
    

}
