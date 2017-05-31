
//
//  dropDownMenuViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 31.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit

class dropDownMenuViewController: UIViewController {

    @IBOutlet weak var viewDropDownMenu: UIView!
    
    
    //functions
    @IBAction func showDropdownMenu(_ sender: UIBarButtonItem) {
        
        if (viewDropDownMenu.isHidden == true){
            viewDropDownMenu.isHidden = false
        }
        else if (viewDropDownMenu.isHidden == false){
            viewDropDownMenu.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDropDownMenu.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
