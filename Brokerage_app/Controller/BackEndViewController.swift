//
//  BackEndViewController.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import UIKit
import RealmSwift
class BackEndViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var heightStack: NSLayoutConstraint!
    @IBOutlet weak var heightOfStack: NSLayoutConstraint!
    @IBOutlet weak var Stack: UIStackView!
    @IBOutlet weak var bottomOfStack: NSLayoutConstraint!
     var Data = NewData()
    @IBOutlet weak var Program: UITextField!
    @IBOutlet weak var Partner: UITextField!
    @IBOutlet weak var FromAmount: UITextField!
    @IBOutlet weak var ToAmount: UITextField!
    @IBOutlet weak var FromYear: UITextField!
    @IBOutlet weak var ToYear: UITextField!
    @IBOutlet weak var Payment: UITextField!
    @IBOutlet weak var Coverage: UITextField!
    @IBOutlet weak var MinFees: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("((  \(Realm.Configuration.defaultConfiguration.fileURL) ))")
        var tap = UITapGestureRecognizer(target: self, action: #selector(BackEndViewController.textFieldDidEndEditing))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        DisplayDelegete()
    }
    
    //display delegete
    
    func DisplayDelegete(){
        Partner.delegate = self
        Program.delegate = self
        FromAmount.delegate = self
        ToAmount.delegate = self
        FromYear.delegate = self
        ToYear.delegate = self
        Payment.delegate = self
        Coverage.delegate = self
        MinFees.delegate = self
    }
    
    //animation kayboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightOfStack.constant = 11
            self.bottomOfStack.constant = 18
            self.heightStack.constant = 302
            self.Stack.spacing = 15
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightOfStack.constant = 40
            self.bottomOfStack.constant = 75
            self.heightStack.constant = 370
            self.Stack.spacing = 32
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //alert
    
    func alerts(message:String){
        let alert = UIAlertController(title: "Alert", message: "\(message) . ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    @IBAction func Create(_ sender: Any) {
        if Partner.text == "" {
            alerts(message: "Please Enter Partner name")
        }else if Program.text == ""{
            alerts(message: "Please Enter Program")
        }else if FromAmount.text == ""{
            alerts(message: "Please Enter From Amount")
        }else if ToAmount.text == ""{
            alerts(message: "Please Enter To Amount")
        }else if FromYear.text == ""{
            alerts(message: "Please Enter From Year")
        }else if ToYear.text == ""{
            alerts(message: "Please Enter To Year")
        }else if Payment.text == ""{
            alerts(message: "Please Enter Payment")
        }else if Coverage.text == ""{
            alerts(message: "Please Enter Coverage")
        }else if MinFees.text == ""{
            alerts(message: "Please Enter MinFees")
        }else{
           
            Data.Partner = Partner.text!
            Data.Program = Program.text!
            do{
                Data.FromAmount = Double(FromAmount.text!)!
                Data.ToAmount = Double(ToAmount.text!)!
                Data.FromYear = Double(FromYear.text!)!
                Data.ToYear = Double(ToYear.text!)!
                Data.Payment = Double(Payment.text!)!
                Data.Coverage = Double(Coverage.text!)!
                Data.MiniFees = Double(MinFees.text!)!
            }catch{alerts(message: "Enter Number not Character or Symbols ")}
        
            let realm = try! Realm()
            try! realm.write{
                realm.add(Data)
            }
        }
    }
    @IBAction func CreateClose(_ sender: Any) {
        
        if Partner.text == "" {
            alerts(message: "Please Enter Partner name")
        }else if Program.text == ""{
            alerts(message: "Please Enter Program")
        }else if FromAmount.text == ""{
            alerts(message: "Please Enter From Amount")
        }else if ToAmount.text == ""{
            alerts(message: "Please Enter To Amount")
        }else if FromYear.text == ""{
            alerts(message: "Please Enter From Year")
        }else if ToYear.text == ""{
            alerts(message: "Please Enter To Year")
        }else if Payment.text == ""{
            alerts(message: "Please Enter Payment")
        }else if Coverage.text == ""{
            alerts(message: "Please Enter Coverage")
        }else if MinFees.text == ""{
            alerts(message: "Please Enter MinFees")
        }else{
            Data.Partner = Partner.text!
            Data.Program = Program.text!
            do{
                Data.FromAmount = Double(FromAmount.text!)!
                Data.ToAmount = Double(ToAmount.text!)!
                Data.FromYear = Double(FromYear.text!)!
                Data.ToYear = Double(ToYear.text!)!
                Data.Payment = Double(Payment.text!)!
                Data.Coverage = Double(Coverage.text!)!
                Data.MiniFees = Double(MinFees.text!)!
            }catch{alerts(message: "Enter Number not Character or Symbols ")}
            
            let realm = try! Realm()
            try! realm.write{
            realm.add(Data)
            }
        }
        guard(navigationController?.popToRootViewController(animated: true) != nil)
            else{return}
    }
    
}
