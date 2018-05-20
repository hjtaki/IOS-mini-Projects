//
//  ViewController2.swift
//  SignUpProject
//
//  Created by 한진탁 on 2018-05-17.
//  Copyright © 2018 jintakhan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var idtext: UITextField!
    @IBOutlet weak var pwtext: UITextField!
    @IBOutlet weak var pwtext2: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var selfTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func storedata(_ sender: Any) {
        StoreData.shared.id = idtext.text
        StoreData.shared.pw = pwtext.text
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfTextView.delegate = self
        self.nextButton.isUserInteractionEnabled = false
        self.nextButton.setTitleColor(.gray, for: .normal)
    }
    
    func textViewDidChange(_ selfTextView: UITextView) { //Handle the text changes here
        if idtext.text != "" && pwtext.text == pwtext2.text && selfTextView.text != "" && imageView.image != nil{
            self.nextButton.isUserInteractionEnabled = true
            self.nextButton.setTitleColor(.blue, for: .normal)
        }
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        if idtext.text != "" && pwtext.text == pwtext2.text && selfTextView.text != "" && imageView.image != nil{
            self.nextButton.isUserInteractionEnabled = true
            self.nextButton.setTitleColor(.blue, for: .normal)
        }
        
        if idtext.text == "" || pwtext.text != pwtext2.text || selfTextView.text == "" || imageView.image == nil{
            self.nextButton.isUserInteractionEnabled = false
            self.nextButton.setTitleColor(.gray, for: .normal)
        }
        
    }
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        print("canceled")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.imageView.image = originalImage
            print("selected")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
