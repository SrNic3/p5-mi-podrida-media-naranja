//
//  SentenceViewController.swift
//  Funeral de la media naranja
//
//  Created by Daniel S on 23/11/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import UIKit

class SentenceViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as? AppDelegate
        let sentenceDate = del?.getPresenter().getSentenceDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: sentenceDate!)
        
        dateLabel.text = dateString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack() {
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().goBack()
    }
    
}
