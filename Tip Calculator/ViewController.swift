//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Hackintosh on 12/13/16.
//  Copyright © 2016 Hackintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    let defaults = UserDefaults.standard
    let tipPercent = [0, 0.18, 0.2, 0.25]

    //static label
    @IBOutlet weak var billStatic: UILabel!
    @IBOutlet weak var tipStatic: UILabel!
    @IBOutlet weak var totalStatic: UILabel!
    @IBOutlet weak var tipAmountStatic: UILabel!
    
    
    @IBOutlet weak var bar: UIView!

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.view.endEditing(true)
        let defaultChoice = defaults.integer(forKey: "DefaultChoice")
        tipSegment.selectedSegmentIndex = defaultChoice
        calculateTIp(self)
        
        let isNight = defaults.bool(forKey: "isNight")
        
        if isNight {turnOnNightMode()}
        else {turnOffNightMode()}
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        
    }

    @IBAction func calculateTIp(_ sender: AnyObject) {
        
        let billAmount = Double(billField.text!) ?? 0.00
        let tipAmount: Double = billAmount * tipPercent[tipSegment.selectedSegmentIndex]
        let totalAmount: Double = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
    
    func turnOnNightMode()
    {
        self.view.backgroundColor = UIColor.darkGray
        bar.backgroundColor = UIColor.cyan
        tipLabel.textColor = .green
        totalLabel.textColor = .green
        tipSegment.tintColor = .yellow
        billStatic.textColor = .blue
        tipStatic.textColor = .blue
        totalStatic.textColor = .blue
        billField.backgroundColor = UIColor.gray
        billField.textColor = .green
        tipAmountStatic.textColor = .yellow
    }
    
    func turnOffNightMode()
    {
        self.view.backgroundColor = UIColor.white
        bar.backgroundColor = UIColor.darkGray
        tipLabel.textColor = .black
        totalLabel.textColor = .black
        tipSegment.tintColor = .blue
        billStatic.textColor = .black
        tipStatic.textColor = .black
        totalStatic.textColor = .black
        billField.backgroundColor = .white
        billField.textColor = .black
        tipAmountStatic.textColor = .black
    }

}

