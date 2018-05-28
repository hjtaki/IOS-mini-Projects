//
//  ViewController3.swift
//  WorldWeather
//
//  Created by 한진탁 on 2018-05-27.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController3: UIViewController{
    

    var weatherfromViewcontroller2: String?
    var statefromViewcontroller2: String?
    var celsiusfromViewcontroller2: String?
    var rainfallProbabilityfromViewcontroller2: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var celsius: UILabel!
    @IBOutlet weak var rainfallProbability: UILabel!
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.weather.text = self.weatherfromViewcontroller2
        self.state.text = self.statefromViewcontroller2
        self.celsius.text = self.celsiusfromViewcontroller2
        self.rainfallProbability.text = self.rainfallProbabilityfromViewcontroller2

        
        let str : String = rainfallProbability.text!
        let index = str.index(str.startIndex, offsetBy: 22)
        let rainposi : Int = Int(str.substring(from: index))!
       
//        let str2 : String = celsius.text!
////        print("str2 : \(str2)") //  C : 5.6
//        let index2 = str2.index(str2.startIndex, offsetBy: 5)
//        let tempInCel : Int = Int(str2.substring(from: index2))!
//        print(tempInCel)
        
        
        
        if rainposi > 80{
            imageView?.image = #imageLiteral(resourceName: "rainy")
//        }else if rainposi > 80 && Int(celsius.text) < 10{
//            imageView?.image = #imageLiteral(resourceName: "snowy")
            
        }else if rainposi > 50{
            imageView?.image = #imageLiteral(resourceName: "cloudy")
        }else {
            imageView?.image = #imageLiteral(resourceName: "sunny")
        }

        if rainposi > 70{
            rainfallProbability?.textColor = UIColor.orange
        }

//        if Int(state.text) < 13{
//            state?.textColor = UIColor.blue
//        }
    }
    
    
    
}
    
    
    

