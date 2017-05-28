//  ViewController.swift
//  UiaBook
//
//  Created by erik angell berg on 19.04.2017.
//  Copyright © 2017 erik angell berg. All rights reserved.
//
// Viser hvordan Xcode blir koblet sammen med Firebase.

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var label1: UILabel!
    
    var ref:FIRDatabaseReference?
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var Plasser: UITextField!
    @IBOutlet weak var Detaljer: UITextField!
    
    
    @IBAction func finnRom(_ sender: Any)
    {
        
        ref = FIRDatabase.database().reference()
        
        if myTextField.text != ""
        
        {
            
        ref?.child("Rom").childByAutoId().setValue(myTextField.text)
            myTextField.text = ""
            
        }
        
        if Plasser.text != ""
        {
            ref?.child("Plasser").childByAutoId().setValue(Plasser.text)
            Plasser.text = ""
            
        }
        
        if Detaljer.text != ""
        {
            ref?.child("Detaljer").childByAutoId().setValue(Detaljer.text)
            Detaljer.text = ""
        }
    }
    
    
    let bygg = ["47 120", "F1 112", "50 036"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bygg[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bygg.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label1.text = bygg[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
