//
//  FirstViewController.swift
//  RoomBooking3
//
//  Created by Gruppe10 on 18.04.2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit
//import Fvarbase
import FirebaseAuth

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var buttonLogOut: UIButton!
    @IBOutlet weak var viewDropDownMenu: UIView!
    
    @IBAction func showDropDownMenu(_ sender: UIBarButtonItem) {
        if (viewDropDownMenu.isHidden == true){
            viewDropDownMenu.isHidden = false
        }
        else if (viewDropDownMenu.isHidden == false){
            viewDropDownMenu.isHidden = true
        }
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "segueMainToLogin", sender: self)

        
    }
    
    
    
let bookingList = ["Bygg 47 Rom 105 Mandag kl 11-12", "Bygg 47 Rom 105 Tirsdag kl 11-12"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return bookingList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yourBookings = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "yourBookings")
        yourBookings.textLabel?.text = bookingList[indexPath.row]
        return yourBookings
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

