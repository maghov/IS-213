//
//  MyPageViewController.swift
//  
//
//  Created by Magnus Høvik on 01.06.2017.
//
//

import UIKit
import Firebase

class MyPageViewController: UIViewController {

   
    @IBOutlet weak var viewDropDownMenu: UIView!
    
    @IBAction func buttonDropDownMenu(_ sender: UIBarButtonItem) {
        if (viewDropDownMenu.isHidden == true){
            viewDropDownMenu.isHidden = false
        }
        else if (viewDropDownMenu.isHidden == false){
            viewDropDownMenu.isHidden = true
        }

    }
    
    @IBAction func buttonLogOut(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "segueMyPageToLogin", sender: self)
    }
    
   
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
