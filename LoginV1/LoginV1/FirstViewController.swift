//
//  FirstViewController.swift
//  RoomBooking3
//
//  Created by Magnus Høvik on 18.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
//import Firebase
import FirebaseAuth

class FirstViewController: UIViewController{
    
    @IBOutlet weak var buttonLogOut: UIBarButtonItem!
    @IBAction func buttonLogOut(_ sender: UIBarButtonItem) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "segueMainToLogin", sender: self)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

