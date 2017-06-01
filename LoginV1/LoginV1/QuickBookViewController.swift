//
//  QuickBookViewController.swift
//  LoginV1
//
//  Created by Gruppe10 on 31.05.2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit
import  FirebaseAuth

class QuickBookViewController: UIViewController {

    @IBOutlet weak var viewDropDownMenu: UIView!
    
    @IBOutlet weak var buttonLogout: UIButton!
    @IBAction func showDropDownMenu(_ sender: UIBarButtonItem) {
        
        if (viewDropDownMenu.isHidden == true){
            viewDropDownMenu.isHidden = false
        }
        else if (viewDropDownMenu.isHidden == false){
            viewDropDownMenu.isHidden = true
        }
    }
    
    //Logs out the user.
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "quickBookToLogin", sender: self)
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
