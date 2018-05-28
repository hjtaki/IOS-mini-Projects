//
//  ViewController2.swift
//  WorldWeather
//
//  Created by 한진탁 on 2018-05-24.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let customCellIdentifier: String = "CustomCityCell"
    var weatherInfo :[CityList] = []
    
    var cityNameEng : String!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("self.weatherInfo.count : \(self.weatherInfo.count)")
        return  self.weatherInfo.count
        
    }
    
    
    //    {
    //        "city_name":"파리",
    //        "state":10,
    //        "celsius":11.3,
    //        "rainfall_probability":90
    //    },
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView------")

        let cell: CustomCityCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomCityCell
        
        let customCellClass: CityList = self.weatherInfo[indexPath.row]
        
        print("customCellClass : \(customCellClass)")
        cell.cityName?.text = customCellClass.city_name
        cell.state?.text = " F : \(String(customCellClass.state))"
        cell.celsius?.text = " C : \(String(customCellClass.celsius))"
        cell.rainfallProbability?.text = "rainfall_probability: \(String(customCellClass.rainfall_probability))"

        // rainy, cloudy, snowy, sunny
        
        if customCellClass.rainfall_probability > 80{
            cell.imageView?.image = #imageLiteral(resourceName: "rainy")
        }else if customCellClass.rainfall_probability > 80 && customCellClass.celsius < 10{
            cell.imageView?.image = #imageLiteral(resourceName: "snowy")
        }else if customCellClass.rainfall_probability > 50{
            cell.imageView?.image = #imageLiteral(resourceName: "cloudy")
        }else {
            cell.imageView?.image = #imageLiteral(resourceName: "sunny")
        }
        
        if customCellClass.rainfall_probability > 70{
            cell.rainfallProbability?.textColor = UIColor.orange
        }
        
        if customCellClass.state < 13{
            cell.state?.textColor = UIColor.blue
        }
        

        return cell
    }
    
    

    
    override func viewDidLoad() {
        print("viewController 2 loaded--------------------")
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        // open friends file from Assest
        guard let dataAsset: NSDataAsset = NSDataAsset(name: cityNameEng) else{
            return
        }
        
        print("aaaassettt : \(dataAsset)")
        //aaaassettt
        //<NSDataAsset: 0x604000017070> name:'fr' typeIdentifier='public.data' data=0x604000433520 (length=1705)
    
        //do decode
        do{
            print(" WEATHER INFO ----------1")
            self.weatherInfo = try jsonDecoder.decode([CityList].self, from: dataAsset.data)
            print(" WEATHER INFO ----------2")
            print(weatherInfo)
            
        }catch{
            print(error.localizedDescription)
            print("errorrrrrr")
        }
        
        //put on table view
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController : ViewController3 = segue.destination as? ViewController3 else{
            return
        }
    
        guard let cell: CustomCityCell = sender as? CustomCityCell else {
            return
        }
        
//        sender : Optional(<WorldWeather.CustomCityCell: 0x7fdcad839600; baseClass = UITableViewCell;
//        frame = (0 0; 414 100); clipsToBounds = YES; autoresize = W; layer = <CALayer: 0x600000428a80>>)

        nextViewController.weatherfromViewcontroller2 = cell.cityName?.text
        nextViewController.statefromViewcontroller2 = cell.state?.text
        nextViewController.celsiusfromViewcontroller2 = cell.celsius?.text
        nextViewController.rainfallProbabilityfromViewcontroller2 = cell.rainfallProbability?.text

}
}
