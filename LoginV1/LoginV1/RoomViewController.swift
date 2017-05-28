//
//  RoomViewController.swift
//  RoomBooking3
//
//  Created by Mohammad Hussain on 21/04/2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
import Firebase



class RoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var ref: FIRDatabaseReference!

      @IBOutlet weak var navigationBar: UINavigationBar!
    
    // Data model: These strings will be the data for the table view cells

  let time: [String] = ["10 - 11                                       " + roomList[myIndex].tielleve!,
                        
                        "11 - 12                                       " + roomList[myIndex].ellevetolv!]
                          
    
    
 

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var labelRoomNumber: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        navigationBar.topItem?.title = roomList[myIndex].name
        
        labelRoomNumber.text = roomList[myIndex].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.time.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.time[indexPath.row]

        
        
        return cell
    }
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Bekreft", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.confirm()
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Nei", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            

        }))
        self.present(alert, animated: true, completion: nil)

        
        
    }
    


    func confirm() {
        
        self.ref = FIRDatabase.database().reference()
        
        let prntRef  = FIRDatabase.database().reference().child("list").child(roomList[myIndex].name!)
        
        if roomList[myIndex].tielleve! == "Ledig" {
            
            prntRef.updateChildValues(["tielleve": "Opptatt"])
            
        } else if roomList[myIndex].tielleve! == "Opptatt" {
            
            prntRef.updateChildValues(["tielleve": "Ledig"])
        
        }
            
        if roomList[myIndex].ellevetolv! == "Ledig" {
            
            prntRef.updateChildValues(["ellevetolv": "Opptatt"])
            
        } else if roomList[myIndex].ellevetolv! == "Opptatt" {
            
            prntRef.updateChildValues(["ellevetolv": "Ledig"])
            

            
            
        } else {
            
            print("test")
            
            
        }
        
        self.refreshTable()
    }
    
    func refreshTable() {
        self.tableView.reloadData()
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!)
        
    }
      
        
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
