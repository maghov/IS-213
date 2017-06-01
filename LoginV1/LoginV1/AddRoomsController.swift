//
//  AddRoomsController.swift
//  LoginV1
//
//  Created by Gruppe10 on 26.05.2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit
import Firebase

var refRoomsFromDataBase: FIRDatabaseReference!


class AddRoomsController: UIViewController {

    @IBOutlet weak var textFieldRoomName: UITextField!
    @IBOutlet weak var textFieldNumberOfSeats: UITextField!
    
    @IBOutlet weak var textFieldDetails: UITextField!
    
    @IBOutlet weak var viewDropDownMenu: UIView!
    
    @IBAction func showDropDownMenu(_ sender: UIBarButtonItem){
        if (viewDropDownMenu.isHidden == true ){
            viewDropDownMenu.isHidden = false
        }else if (viewDropDownMenu.isHidden == false) {
            viewDropDownMenu.isHidden = true
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "segueAddRoomsToLogin", sender: self)
    }
    
    
    
    @IBAction func buttonAddRoom(_ sender: UIButton) {
        addRoom()
    }
    //This function adds rooms to the firebase database with the following values:
    func addRoom() {
        let key = textFieldRoomName.text! as String
        let tiElleve = "Ledig"
        let elleveTolv = "Ledig"
        let tolvEtt = "Ledig"
        let ettTo = "Ledig"
        let toTre = "Ledig"
        let treFire = "Ledig"
        let booketAvTiElleve = ""
        let booketAvElleveTolv = ""
        let booketAvTolvEtt = ""
        let booketAvEttTo = ""
        let booketAvToTre = ""
        let booketAvTreFire = ""
        
        let room = ["id": key,
                    "name": textFieldRoomName.text! as String,
                    "space": textFieldNumberOfSeats.text! as String,
                    "details": textFieldDetails.text! as String,
                    "tiElleve": tiElleve,
                    "elleveTolv": elleveTolv,
                    "tolvEtt" : tolvEtt,
                    "ettTo": ettTo,
                    "toTre": toTre,
                    "treFire": treFire,
                    "booketAvTiElleve": booketAvTiElleve,
                    "booketAvElleveTolv": booketAvElleveTolv,
                    "booketAvTolvEtt": booketAvTolvEtt,
                    "booketAvEttTo": booketAvEttTo,
                    "booketAvToTre": booketAvToTre,
                    "booketAvTreFire": booketAvTreFire
            
            
            
        ]
        
        refRoomsFromDataBase.child(key).setValue(room)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         refRoomsFromDataBase = FIRDatabase.database().reference().child("list")
        viewDropDownMenu.isHidden = true
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
}

