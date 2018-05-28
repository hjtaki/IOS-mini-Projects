//
//  ViewController.swift
//  WorldWeather
//
//  Created by 한진탁 on 2018-05-23.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
// id of cell
    let cellIdentifier: String = "cell"
    
    var countryNames : [Countries] = []
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.countryNames.count)
        return self.countryNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //reuse of cell
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        //data setting
        //make countryNames to rows
        let text: Countries = self.countryNames[indexPath.row]
        
        print(text)
        cell.textLabel?.text = text.asset_name
        print(text.korean_name)
        let imgName: String = "flag_" + text.asset_name
        print(imgName) //frag_kr, frag_de ...
        
        cell.imageView?.image = UIImage(named: imgName)
        
        print(cell)
        return cell
    }
    
    // insert title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "title!"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call JSON data and put in friends
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        // open friends file from Assest
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else{
            print("no file")
            return
        }
        
        //do decode
        do{
            self.countryNames = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
            print(countryNames)
            
//            Countries(korean_name: "한국", asset_name: "kr")
//            <UITableViewCell: 0x7fa89e024600; frame = (0 0; 375 44); text = '한국'; clipsToBounds = YES; layer =        <CALayer: 0x600000439660>>
        
        }catch{
            print(error.localizedDescription)
        }
        
        //put on table view
        self.tableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let nextViewController : ViewController2 = segue.destination as? ViewController2 else{
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        nextViewController.cityNameEng = cell.textLabel?.text
    }




}

