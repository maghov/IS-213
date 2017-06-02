//
//  AboutRoomBookingViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 02.06.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import FirebaseAuth

class AboutRoomBookingViewController: UIViewController {
    
   
    @IBOutlet weak var viewDropDownMenu: UIView!

    @IBAction func showDropDownMenu(_ sender: UIBarButtonItem) {
        if (viewDropDownMenu.isHidden == true) {
            viewDropDownMenu.isHidden = false}
            
        else if (viewDropDownMenu.isHidden == false) {
            viewDropDownMenu.isHidden = true
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "segueAboutToLogin", sender: self)
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
