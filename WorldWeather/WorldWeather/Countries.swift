//
//  Countries.swift
//  WorldWeather
//
//  Created by 한진탁 on 2018-05-24.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import Foundation
//[
//    {"korean_name":"한국","asset_name":"kr"},
//    {"korean_name":"독일","asset_name":"de"},
//    {"korean_name":"이탈리아","asset_name":"it"},
//    {"korean_name":"미국","asset_name":"us"},
//    {"korean_name":"프랑스","asset_name":"fr"},
//    {"korean_name":"일본","asset_name":"jp"}
//]
//
//[
//    {
//        "city_name":"파리",
//        "state":10,
//        "celsius":11.3,
//        "rainfall_probability":90
//    },


struct Countries: Codable{
    let korean_name: String
    let asset_name: String
    
}
