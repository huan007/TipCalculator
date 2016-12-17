//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Hackintosh on 12/14/16.
//  Copyright © 2016 Hackintosh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultAmountSegment: UISegmentedControl!
    
    @IBOutlet weak var colorSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultValueChanged(_ sender: AnyObject?)
    {
        let choice = defaultAmountSegment.selectedSegmentIndex
        defaults.set(choice, forKey: "DefaultChoice")
    }
    @IBAction func colorModeChange(_ sender: Any) {
        let mode = colorSwitch.isOn
        defaults.set(mode, forKey: "isNight")
        }
	
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let defaultChoice = defaults.integer(forKey: "DefaultChoice")
        defaultAmountSegment.selectedSegmentIndex = defaultChoice
        colorSwitch.isOn = defaults.bool(forKey: "isNight")
        
    }

    
}
