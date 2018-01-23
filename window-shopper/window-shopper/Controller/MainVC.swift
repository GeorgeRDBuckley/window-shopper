//
//  MainVC.swift
//  window-shopper
//
//  Created by George Buckley on 23/01/2018.
//  Copyright © 2018 George Buckley. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: currencyTxtField!
    @IBOutlet weak var priceTxt: currencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculateBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculateBtn.backgroundColor = #colorLiteral(red: 0.9915295243, green: 0.6502454281, blue: 0, alpha: 1)
        calculateBtn.setTitle("Calculate", for: .normal)
        calculateBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculateBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        wageTxt.inputAccessoryView = calculateBtn
        priceTxt.inputAccessoryView = calculateBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
    }
    
    @objc func calculate() {
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text{
            if let wage = Double(wageTxt), let price = Double(priceTxt){
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                let result = Wage.getHours(forWage: wage, andPrice: price)
                if result == 1 {
                    hoursLbl.text = "hour"
                } else {
                    hoursLbl.text = "hours"
                }
                resultLbl.text = "\(result)"
            }
        }
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
