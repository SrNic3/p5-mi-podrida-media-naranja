//
//  HomeViewController.swift
//  Funeral de la media naranja
//
//  Created by Daniel S on 23/11/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.continueTap))
        homeLabel.isUserInteractionEnabled = true
        homeLabel.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func continueTap(){
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getPresenter().goToBornDateScreen()
    }
    
}
