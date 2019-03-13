//
//  View.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class MyButton:UIButton{
    
    @IBInspectable var cornerRadius:CGFloat = 0 { didSet{ layer.cornerRadius = cornerRadius } }
    @IBInspectable var BorderColor:UIColor = UIColor.clear { didSet{ layer.borderColor = BorderColor.withAlphaComponent(1).cgColor } }
    @IBInspectable var BorderWidth:CGFloat = 0 { didSet{ layer.borderWidth = BorderWidth  } }
}

