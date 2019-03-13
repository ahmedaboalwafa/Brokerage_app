//
//  ViewController.swift
//  Brokerage_app
//
//  Created by Ahmed Aboalwafa on 2/16/19.
//  Copyright © 2019 Ahmed Aboalwafa. All rights reserved.
//

import UIKit
//import RealmSwift
class ViewController: UIViewController,UITextFieldDelegate {

    var searchDATA = [SearchedData]()
    typealias element = (String,[SearchedData])
    
    @IBOutlet weak var heightOfStack: NSLayoutConstraint!
    @IBOutlet weak var bottomOfStack: NSLayoutConstraint!
    @IBOutlet weak var heightStack: NSLayoutConstraint!
    @IBOutlet weak var Stack: UIStackView!
    @IBOutlet weak var Brand: UITextField!
    @IBOutlet weak var Model: UITextField!
    @IBOutlet weak var YearOfManufacture: UITextField!
    @IBOutlet weak var MarketValue: UITextField!
    @IBOutlet weak var Status: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(BackEndViewController.textFieldDidEndEditing))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        DisplayDelegete()
    }
    
    //display delegete
    
    func DisplayDelegete(){
        Brand.delegate = self
        Model.delegate = self
        YearOfManufacture.delegate = self
        MarketValue.delegate = self
        Status.delegate = self
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
        let alert = UIAlertController(title: "Alert", message: "Please Enter \(message) . ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // filter
    func conditions(mark:Double , YEAR:Double , from : Double , to : Double , price : Double ,price1:Double , price2 : Double , de : Int){
        if mark <= to && mark >= from && YEAR <= 2019 && YEAR >= 2016 {
            searchDATA.append(SearchedData(Rate: String(price), netpremium: String((mark * price)/100), totalpentium: String((mark * price)/100), deduct: String(de)))
    
        }else if mark <= to && mark >= from && YEAR < 2016 && YEAR >= 2015 {
            searchDATA.append(SearchedData(Rate: String(price1), netpremium: String((mark * price1)/100), totalpentium: String((mark * price1)/100), deduct: String(de)))
        }else if mark <= to && mark >= from && YEAR < 2015 && YEAR >= 2005{
            searchDATA.append(SearchedData(Rate: String(price2), netpremium: String((mark * price2)/100), totalpentium: String((mark * price2)/100), deduct: String(de)))
            
        }
    }
    
    func filter (mark:Double , YEAR:Double ){
        searchDATA.removeAll()
        conditions(mark: mark, YEAR: YEAR, from: 0, to: 150000.0, price: 4.5, price1: 5.5, price2: 6.5 ,de:10)
        conditions(mark: mark, YEAR: YEAR, from: 151000.0, to: 250000.0, price: 3.75, price1: 4.25, price2: 5.5,de: 10)
        conditions(mark: mark, YEAR: YEAR, from: 251000.0, to: 300000.0, price: 3.4, price1: 3.9, price2: 4.75, de: 10)
        conditions(mark: mark, YEAR: YEAR, from: 301000.0, to: 500000.0, price: 2.9, price1: 3.15, price2: 3.9 ,de: 10)
        conditions(mark: mark, YEAR: YEAR, from: 500000.0, to: 1000000.0, price: 2.8, price1: 2.9, price2: 3.4 , de: 25)
        conditions(mark: mark, YEAR: YEAR, from: 1000000.0, to: 1500000.0, price: 2.55, price1: 2.55, price2: 2.9 ,de: 25)
        conditions(mark: mark, YEAR: YEAR, from: 1500000.0, to: 10000000000000, price: 2.35, price1: 2.4, price2: 2.75 ,de: 25 )
    }

    //Buttons
    
    @IBAction func Search(_ sender: Any) {
        if Brand.text == "" {
            alerts(message: "Brand name")
        }else if Model.text == ""{
            alerts(message: "Model name")
        }else if YearOfManufacture.text == ""{
            alerts(message: "Year Of Manufacture")
        }else if MarketValue.text == ""{
            alerts(message: "Market Value")
        }else if Status.text == ""{
            alerts(message: "Status")
        }else{
            
            let marketvalue : Double
            let years : Double
            do{
                marketvalue = Double(MarketValue.text!)!
                years = Double(YearOfManufacture.text!)!
            }catch{alerts(message: "numbers not characters or symbols .")
                return
            }
            
            filter(mark: marketvalue, YEAR: years)
            let data : element = (self.MarketValue.text!,searchDATA)
            performSegue(withIdentifier: "ToSearch", sender: data )
        }
    }

    
    @IBAction func BackEnd(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSearch" {
            if let destination = segue.destination as? SearchViewController{
                if let item = sender as? element {
                    destination.data = item.1
                    destination.price = Double(item.0)
                }
            }
        }
    }
    
}

