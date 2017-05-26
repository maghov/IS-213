//
//  AddRoomsController.swift
//  LoginV1
//
//  Created by Magnus Høvik on 26.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import Firebase

var refRoomsFromDataBase: FIRDatabaseReference!


class AddRoomsController: UIViewController {

    @IBOutlet weak var textFieldRoomName: UITextField!
    @IBOutlet weak var textFieldNumberOfSeats: UITextField!
    
    @IBOutlet weak var textFieldDetails: UITextField!
    
    @IBAction func buttonAddRoom(_ sender: UIButton) {
        addRoom()
    }
    
    func addRoom() {
        let key = textFieldRoomName.text! as String
        
        let room = ["id": key,
                    "name": textFieldRoomName.text! as String,
                    "space": textFieldNumberOfSeats.text! as String,
                    "details": textFieldDetails.text! as String
        ]
        
        refRoomsFromDataBase.child(key).setValue(room)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         refRoomsFromDataBase = FIRDatabase.database().reference().child("list")
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
}

