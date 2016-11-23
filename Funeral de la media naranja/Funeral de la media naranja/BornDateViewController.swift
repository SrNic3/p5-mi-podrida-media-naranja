//
//  BornDateViewController.swift
//  Funeral de la media naranja
//
//  Created by Daniel S on 23/11/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import UIKit

class BornDateViewController: UIViewController {
    
    @IBOutlet weak var bornDatePicker: UIDatePicker!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bornDatePicker.setValue(UIColor.white, forKey: "textColor")
        bornDatePicker.setValue(Date(), forKey: "maximumDate")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTap() {
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().setBornDate(date: bornDatePicker.date)
        del?.getPresenter().goToFallingDateScreen()
    }
    
    @IBAction func goBack() {
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().goBack()
    }
}
