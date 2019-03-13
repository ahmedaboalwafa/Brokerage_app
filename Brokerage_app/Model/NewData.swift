//
//  NewData.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import Foundation
import RealmSwift

class NewData : Object {
    
    @objc dynamic var Partner : String = ""
    @objc dynamic var Program : String = ""
    @objc dynamic var FromAmount : Double = 0
    @objc dynamic var ToAmount : Double = 0
    @objc dynamic var FromYear : Double = 0
    @objc dynamic var ToYear : Double = 0
    @objc dynamic var Payment : Double = 0
    @objc dynamic var Coverage : Double = 0
    @objc dynamic var MiniFees : Double = 0
    
}
