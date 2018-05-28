//
//  CustomCityCell.swift
//  WorldWeather
//
//  Created by 한진탁 on 2018-05-24.
//  Copyright © 2018 jintakhan. All rights reserved.
//


//[
//    {
//        "city_name":"파리",
//        "state":10,
//        "celsius":11.3,
//        "rainfall_probability":90
//    },


import UIKit

class CustomCityCell : UITableViewCell{
 
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var celsius: UILabel!
    @IBOutlet weak var rainfallProbability: UILabel!
    
}
