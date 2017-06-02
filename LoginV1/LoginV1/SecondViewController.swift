//
//  SecondViewController.swift
//  RoomBooking3
//
//  Created by Gruppe10 on 18.04.2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit
import Firebase

var roomList = [RoomModel]()
var refRooms: FIRDatabaseReference!
var myIndex = Int()

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewDropDownMenu: UIView!
    @IBOutlet weak var textFieldSpace: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldDetails: UITextField!
    @IBOutlet weak var tblRooms: UITableView!
    
    //Code for dropdown menu
    @IBAction func showDropDownMenu(_ sender: UIBarButtonItem) {
        if (viewDropDownMenu.isHidden == true){
            viewDropDownMenu.isHidden = false
        }
        else if (viewDropDownMenu.isHidden == false){
            viewDropDownMenu.isHidden = true
        }
    }
    //Logs out the user
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "SegueChooseRoomToLogin", sender: self)
    }
    //This button runs the function addRoom()
    @IBAction func buttonAddRoom(_ sender: UIButton) {
        addRoom()
        
    }

    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        myIndex = indexPath.row
        print("IndexPath ", indexPath.row)
        performSegue(withIdentifier: "segue", sender: self)
        
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomList.count
    }
    
    //Creates rows for every room in the database.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!ViewControllerTableViewCell
        
        let room: RoomModel
        
        room = roomList[indexPath.row]
    
        cell.lblName.text = room.name
        cell.lblSpace.text = "Antall plasser " + room.space!
        cell.lblDetails.text = room.details

        return cell
    }
    
    
    //Function to add a room
    func addRoom() {
        let key = textFieldName.text! as String
    
        let room = ["id": key,
                        "name": textFieldName.text! as String,
                        "space": textFieldSpace.text! as String,
                        "details": textFieldDetails.text! as String
                        ]
    
    refRooms.child(key).setValue(room)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewDropDownMenu.isHidden = true
        
        refRooms = FIRDatabase.database().reference().child("list")
        
        refRooms.observe(FIRDataEventType.value, with:{(snapshot) in
        
            if snapshot.childrenCount > 0 {
                roomList.removeAll()
                
                for rooms in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let roomObject = rooms.value as? [String: AnyObject]
                    let name = roomObject?["name"]
                    let space = roomObject?["space"]
                    let id = roomObject?["id"]
                    let details = roomObject? ["details"]
                    let tiElleve = roomObject? ["tiElleve"]
                    let elleveTolv = roomObject? ["elleveTolv"]
                    let tolvEtt = roomObject? ["tolvEtt"]
                    let ettTo = roomObject? ["ettTo"]
                    let toTre = roomObject? ["toTre"]
                    let treFire = roomObject? ["treFire"]
                    let booketAvTiElleve = roomObject? ["booketAvTiElleve"]
                    let booketAvElleveTolv = roomObject? ["booketAvElleveTolv"]
                    let booketAvTolvEtt = roomObject? ["booketAvTolvEtt"]
                    let booketAvEttTo = roomObject? ["booketAvEttTo"]
                    let booketAvToTre = roomObject? ["booketAvToTre"]
                    let booketAvTreFire = roomObject? ["booketAvTreFire"]
                    
                    let room = RoomModel(id: id as! String?,
                                         name: name as! String?,
                                         space: space as! String?,
                                         details: details as! String?,
                                         tiElleve: tiElleve as! String?,
                                         elleveTolv: elleveTolv as! String?,
                                         tolvEtt: tolvEtt as! String?,
                                         ettTo: ettTo as! String?,
                                         toTre: toTre as! String?,
                                         treFire: treFire as! String?,
                                         booketAvTiElleve: booketAvTiElleve as! String?,
                                         booketAvElleveTolv: booketAvElleveTolv as! String?,
                                         booketAvTolvEtt: booketAvTolvEtt as! String?,
                                         booketAvEttTo: booketAvEttTo as! String?,
                                         booketAvToTre: booketAvToTre as! String?,
                                         booketAvTreFire: booketAvTreFire as! String?)
                    roomList.append(room)
                    
                    
                }
            }
        
            self.tblRooms.reloadData()
            
        })
        
 
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

