//
//  CityList.swift
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

import Foundation

struct CityList: Codable{
    
    let city_name: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Int
    
}
