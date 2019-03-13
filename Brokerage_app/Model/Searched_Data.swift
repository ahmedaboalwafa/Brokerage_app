//
//  Searched_Data.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import Foundation

class SearchedData {
    
    var Rate : String?
    var netpremium : String?
    var totalpentium : String?
    var deduct : String?
    init(Rate : String ,netpremium : String , totalpentium : String ,deduct : String) {
        self.Rate = Rate
        self.netpremium = netpremium
        self.totalpentium = totalpentium
        self.deduct = deduct
    }
}
