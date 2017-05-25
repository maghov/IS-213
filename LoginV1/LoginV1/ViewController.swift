//
//  ViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 21.04.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
   
    @IBOutlet weak var actionButton: UIButton!
   @IBOutlet weak var confirmPasswordText: UITextField!
    
    @IBAction func action(_ sender: UIButton) {
        
        if emailText.text != "" && passwordText.text != ""
        {
            if segmentController.selectedSegmentIndex == 0  //Login user
            {
                FIRAuth.auth()?.signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //Sign in successfull
                        self.performSegue(withIdentifier: "segue1", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                    }
                })
            }
            else // Sign up user
            {
                FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil
                    {
                        self.performSegue(withIdentifier: "segue1", sender: self)                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                        
                    }
                    
                })
            }
            
        }
        
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
