//
//  ViewController.swift
//  Roombooking
//  ViewContoller handles the login and signup. There is also a button to the help page. 
//  Created by Gruppe10 on 21.04.2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit
import FirebaseAuth


var userID = FIRAuth.auth()!.currentUser!.email!
class ViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
    //Is going to handle the auto login.
    @IBAction func switchAutoLogOn(_ sender: UISwitch) {
        if sender.isOn == true {
               // autoLogIn()
            
                //if sender.isOn = true. 
                //The user will be remaind logged in when the app restarts.
        }
        else {
            
            //sender.isOn == false
            //The user must login every time.
        }
    
    }
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    //Button that handles the login and sign up.
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //checks if the email and password fields are NOT empty.
        if emailText.text != "" && passwordText.text != ""
        {
            //checks if the segmentController is on 0 for login.
            if segmentController.selectedSegmentIndex == 0  //Login user
            {
                FIRAuth.auth()?.signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //Sign in successfull -Send user to Tab bar controller
                        self.performSegue(withIdentifier: "segue1", sender: self)
                        print(userID)
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
            else // Sign up user. SegmentController is now on 1.
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
                } else { //Display error message to the user if the passwords are not the same.
                    print("ERROR! Passwords not similar.")
                    let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }else{// Display error message if there are any emty fiels.
            let alert = UIAlertController(title: "Error", message: "Empty field(s)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //Handles the segue between Login and Sign up.
    @IBAction func SegmentControllerView(_ sender: UISegmentedControl) {
        
        if segmentController.selectedSegmentIndex == 0 {
            buttonLogin.setTitle("Login", for: .normal)
            confirmPasswordText.isHidden = true
        }
        else {
            buttonLogin.setTitle("Sign up", for: .normal)
            confirmPasswordText.isHidden = false
        }
    }
    
    // Function that handles the auto login.
    // This does not work as its supposed. Needs help
    func autoLogIn(){
        if FIRAuth.auth()?.currentUser != nil {
            performSegue(withIdentifier: "segue1", sender: self)
        }
    }

    
    
    
    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // if the user does not logout. The user will be send directly to home page.
            if FIRAuth.auth()?.currentUser != nil {
               // performSegue(withIdentifier: "segue1", sender: self)
                print(userID)
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Makes the confirmPassord textfield hidden as default.
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
