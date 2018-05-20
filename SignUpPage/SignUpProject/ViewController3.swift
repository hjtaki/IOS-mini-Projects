//
//  ViewController3.swift
//  SignUpProject
//
//  Created by 한진탁 on 2018-05-17.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUp.isUserInteractionEnabled = false
        self.signUp.setTitleColor(.gray, for: .normal)
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        if phoneNum.text != "" && timeLabel.text != ""  {
            self.signUp.isUserInteractionEnabled = true
            self.signUp.setTitleColor(.blue, for: .normal)
        }
        
        if phoneNum.text == "" || timeLabel.text == ""  {
            self.signUp.isUserInteractionEnabled = false
            self.signUp.setTitleColor(.gray, for: .normal)
        }
        
    }
    
    @IBAction func timePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        self.timeLabel.text = strDate}
    
    
    @IBAction func saveData(_ sender: Any) {
        StoreData.shared.phone = phoneNum.text
        StoreData.shared.birth = timeLabel.text
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
