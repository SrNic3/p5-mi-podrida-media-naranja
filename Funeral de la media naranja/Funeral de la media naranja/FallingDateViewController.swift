//
//  FallingDateViewController.swift
//  Funeral de la media naranja
//
//  Created by Daniel S on 23/11/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import UIKit

class FallingDateViewController: UIViewController {
    
    @IBOutlet weak var fallingDatePicker: UIDatePicker!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fallingDatePicker.setValue(UIColor.white, forKey: "textColor")
        let del = UIApplication.shared.delegate as? AppDelegate
        fallingDatePicker.setValue(Date(), forKey: "maximumDate")
        fallingDatePicker.setValue(del?.getPresenter().getFallingDate(), forKey: "date")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapContinue() {
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().setFallingDate(date: fallingDatePicker.date)
        del?.getPresenter().goToSentenceScreen()
    }
    
    @IBAction func goBack() {
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().goBack()
    }
}
