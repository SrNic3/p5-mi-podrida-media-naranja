//
//  HomePresenter.swift
//  Funeral de la media naranja
//
//  Created by Daniel S on 23/11/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter{
    
    
    var bornDate: Date?
    var fallingDate: Date?
    
    init() {
        NSLog("HOLI HOLITA", "")
    }
    
    func goToBornDateScreen(){
        let del = UIApplication.shared.delegate as? AppDelegate
        let bornDateViewController = BornDateViewController()
        del?.getNavigationController().pushViewController(bornDateViewController, animated: true)
    }
    
    func goToFallingDateScreen(){
        let del = UIApplication.shared.delegate as? AppDelegate
        let fallingDateViewController = FallingDateViewController()
        del?.getNavigationController().pushViewController(fallingDateViewController, animated: true)
    }
    
    
    func goToSentenceScreen(){
        if((bornDate?.compare(fallingDate!)) == ComparisonResult.orderedAscending){
            let del = UIApplication.shared.delegate as? AppDelegate
            let sentenceViewController = SentenceViewController()
            del?.getNavigationController().pushViewController(sentenceViewController, animated: true)
        }else{
            let del = UIApplication.shared.delegate as? AppDelegate
            del?.showAlert()
        }
    }
    
    func goBack(){
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getNavigationController().popViewController(animated:true)
    }
    
    func setBornDate(date: Date){
        bornDate = date
    }
    
    func setFallingDate(date: Date){
        fallingDate = date
    }
    
    
}
