//
//  ViewController.swift
//  pickerView
//
//  Created by Magnus Høvik on 18.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var pickerDatetext: UITextField!
    
    
    let datePicker = UIDatePicker()
    
    var type = ["test", "test2", "test3"]
    
    
   
    
  override func viewDidLoad() {
        super.viewDidLoad()
        createdatePicker()
    
        pickerView.dataSource = self
        pickerView.delegate = self
    
        titleLabel.text = rooms[myIndex]
        descLabel.text = desc[myIndex]
        
    }

    func createdatePicker() {
        
        // date format for picker 
        
        datePicker.datePickerMode = .dateAndTime
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        pickerDatetext.inputAccessoryView = toolbar
        
        //assigning datePicker to text field
        pickerDatetext.inputView = datePicker

    }
    

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = type[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed() {
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        pickerDatetext.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    

}






