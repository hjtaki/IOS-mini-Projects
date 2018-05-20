//
//  ViewController.swift
//  SignUpProject
//
//  Created by 한진탁 on 2018-05-17.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = " \((describing: StoreData.shared.id)), \((describing: StoreData.shared.pw)), \((describing: StoreData.shared.phone)), \((describing: StoreData.shared.birth))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

