//
//  ViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 21.04.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
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
                        //Sign in successfull -Send user to Tab bar controller
                        self.performSegue(withIdentifier: "segue1", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                            let alert = UIAlertController(title: "Error", message: myError, preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
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
                if passwordText.text == confirmPasswordText.text{
                    FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                        if user != nil
                        {
                            self.performSegue(withIdentifier: "segue1", sender: self)                    }
                        else
                        {
                            if let myError = error?.localizedDescription
                            {
                                print(myError)
                                let alert = UIAlertController(title: "Error", message: myError, preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                            else
                            {
                                print("ERROR")
                            }
                            
                        }
                        
                    })
                }else{
                    print("ERROR! Passwords not similar.")
                    
                    let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }else{
            
            let alert = UIAlertController(title: "Error", message: "Empty field(s)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func SegmentControllerView(_ sender: UISegmentedControl) {
    
        if segmentController.selectedSegmentIndex == 0 {
            actionButton.setTitle("Login", for: .normal)
            confirmPasswordText.isHidden = true
        }
        else {
            actionButton.setTitle("Sign up", for: .normal)
            confirmPasswordText.isHidden = false
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPasswordText.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hides keyboard when user touches outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
