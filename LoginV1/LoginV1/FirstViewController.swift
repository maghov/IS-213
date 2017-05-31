//
//  FirstViewController.swift
//  RoomBooking3
//
//  Created by Magnus Høvik on 18.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
//import Fvarbase
import FirebaseAuth

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
let bookingList = ["Bygg 47 Rom 105 Mandag kl 11-12", "Bygg 47 Rom 105 Tirsdag kl 11-12"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return bookingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yourBookings = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "yourBookings")
        yourBookings.textLabel?.text = bookingList[indexPath.row]
        return yourBookings
    }
    

    
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

