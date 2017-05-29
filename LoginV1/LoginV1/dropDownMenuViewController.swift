//
//  dropDownMenuViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 29.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit

class dropDownMenuViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var menuView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuView.isHidden = true
    }
    
    @IBAction func dropDownMenu(_ sender: UIBarButtonItem) {
        if (menuView.isHidden == true){
            menuView.isHidden = false
        }
        else if (menuView.isHidden == false){
            menuView.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
