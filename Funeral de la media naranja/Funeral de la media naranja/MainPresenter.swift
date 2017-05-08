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
    
    struct defaultsKeys {
        static let keyBornDate = "keyBornDate"
        static let keyFallingDate = "keyFallingDate"
    }
    
    
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
        if (getBornDate().compare(getFallingDate())) == ComparisonResult.orderedAscending {
            let del = UIApplication.shared.delegate as? AppDelegate
            let sentenceViewController = SentenceViewController()
            del?.getNavigationController().pushViewController(sentenceViewController, animated: true)
        }else{
            showAlert()
        }
        
        var d1 = getBornDate()
        var d2 = getFallingDate()
        
        var time = d2.timeIntervalSince(d1)
        
        d2.addTimeInterval(time)
        
        NSLog("fecha %s", "fecha")
    }
    
    func goBack(){
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getNavigationController().popViewController(animated:true)
    }
    
    func setBornDate(date: Date){
        let defaults = UserDefaults.standard
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        defaults.setValue(dateString, forKey: defaultsKeys.keyBornDate)
        defaults.synchronize()

    }
    
    func setFallingDate(date: Date){
        let defaults = UserDefaults.standard
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        defaults.setValue(dateString, forKey: defaultsKeys.keyFallingDate)
        defaults.synchronize()
    }
    
    func getBornDate()->Date{
        let defaults = UserDefaults.standard
        if let string = defaults.string(forKey: defaultsKeys.keyBornDate)  {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
           return dateFormatter.date(from: string)!
        }
        return Date()
    }
    
    func getFallingDate()->Date{
         let defaults = UserDefaults.standard
        if let string = defaults.string(forKey: defaultsKeys.keyFallingDate)  {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let date = dateFormatter.date(from: string)!
            return date
        }
        return Date()
    }
    
    
    func getSentenceDate()->Date{
        let d1 = getBornDate()
        var d2 = getFallingDate()
        
        let time = d2.timeIntervalSince(d1)
        
        d2.addTimeInterval(time)
        
        return d2
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Fecha incorrecta", message: "La fecha de enamoramiento no puede ser anterior o igual a la fecha de tu nacimiento.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Atrás", style: UIAlertActionStyle.default, handler: nil))
        let del = UIApplication.shared.delegate as? AppDelegate
        del?.getNavigationController().present(alert, animated: true, completion: nil)
    }
}
