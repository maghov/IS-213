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

    let time: [String] = ["10 - 11                                       " + roomList[myIndex].tielleve!]
                          //"11 - 12               " + roomList[myIndex].tielleve!
                          
    
    
 

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        

        
        navigationBar.topItem?.title = roomList[myIndex].name
        
    
        
        
        
        
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
    
    
    func confirm() {
        
        
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        self.ref = FIRDatabase.database().reference()

        
        
        let prntRef  = FIRDatabase.database().reference().child("list").child(roomList[myIndex].name!)
        
        if roomList[myIndex].tielleve! == "Ledig" {
        
        prntRef.updateChildValues(["tielleve": "Opptatt"])
            
            
        } else if roomList[myIndex].tielleve! == "Opptatt" {
        
        prntRef.updateChildValues(["tielleve": "Ledig"])
        
        } else {
    
        print("test")



    }
        
    }
      
        
        
        
        
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
