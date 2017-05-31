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
    
    var index = 0
    
    
    var ref = FIRDatabase.database().reference()
    
    let prntRef  = FIRDatabase.database().reference().child("list").child(roomList[myIndex].name!)
    
    @IBOutlet weak var tableTime: UITableView!
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    // Data model: These strings will be the data for the table view cells
    
    let time: [String] = ["10 - 11                                       " + roomList[myIndex].tiElleve!,
                          
                          "11 - 12                                       " +  roomList[myIndex].elleveTolv!,
                          
                          "12 - 13                                       " + roomList[myIndex].tolvEtt!,
                          
                          "13 - 14                                       " + roomList[myIndex].ettTo!,
                          
                          "14 - 15                                       " + roomList[myIndex].toTre!,
                          
                          "15 - 16                                       " + roomList[myIndex].treFire!]
    
    
    
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    
    
    @IBOutlet weak var labelRoomNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableTime.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        navigationBar.topItem?.title = roomList[myIndex].name
        
        labelRoomNumber.text = roomList[myIndex].name
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.time.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableTime.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.time[indexPath.row]
        
        
        
        return cell
    }
    
    
    func createAlertUnbook(title: String, message: String) {
        
        let alertUnbook = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alertUnbook.addAction(UIAlertAction(title: "Avbestill", style: UIAlertActionStyle.default, handler: { (action) in
            alertUnbook.dismiss(animated: true, completion: nil)
            
            if self.index == 0 {
                self.confirmtiElleve()
            }
                
            else if self.index == 1 {
                self.confirmelleveTolv()
                
            }
                
            else if self.index == 2 {
                self.confirmTolvEtt()
                
            }
                
            else if self.index == 3 {
                self.confirmEttTo()
                
                
            }
                
            else if self.index == 4 {
                self.confirmToTre()
                
            }
                
            else if self.index == 5 {
                self.confirmTreFire()
                
            }
            
            
            
            
            
        }))
        
        alertUnbook.addAction(UIAlertAction(title: "Avbryt", style: UIAlertActionStyle.destructive, handler: { (action) in
            alertUnbook.dismiss(animated: true, completion: nil)
            
            
            
        }))
        self.present(alertUnbook, animated: true, completion: nil)
        
        
        
    }
    
    
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            if self.index == 0 {
                
                self.confirmtiElleve()
                
            }
                
            else if self.index == 1 {
                self.confirmelleveTolv()
                
            }
                
            else if self.index == 2 {
                self.confirmTolvEtt()
                
            }
                
            else if self.index == 3 {
                self.confirmEttTo()
                
                
            }
                
            else if self.index == 4 {
                self.confirmToTre()
                
            }
                
            else if self.index == 5 {
                self.confirmTreFire()
                
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Avbryt", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func confirmtiElleve() {
        
        if roomList[myIndex].tiElleve == "Ledig" {
            
            prntRef.updateChildValues(["tiElleve": "Opptatt"])
            prntRef.updateChildValues(["booketAvTiElleve": userID])
            
            
        } else if roomList[myIndex].tiElleve == "Opptatt", roomList[myIndex].booketAvTiElleve == userID {
            
            prntRef.updateChildValues(["tiElleve": "Ledig"])
            prntRef.updateChildValues(["booketAvTiElleve": ""])
            
            
            
        } else {
            print("test")
        }
    }
    
    func confirmelleveTolv() {
        
        if roomList[myIndex].elleveTolv == "Ledig" {
            
            prntRef.updateChildValues(["elleveTolv": "Opptatt"])
            prntRef.updateChildValues(["booketAvElleveTolv": userID])
            
            
        } else if roomList[myIndex].elleveTolv == "Opptatt", roomList[myIndex].booketAvElleveTolv == userID {
            
            prntRef.updateChildValues(["elleveTolv": "Ledig"])
            prntRef.updateChildValues(["booketAvElleveTolv": ""])
            
            
            
        } else {
            print("test")
        }
    }
    
    func confirmTolvEtt() {
        
        if roomList[myIndex].tolvEtt == "Ledig" {
            
            prntRef.updateChildValues(["tolvEtt": "Opptatt"])
            prntRef.updateChildValues(["booketAvTolvEtt": userID])
            
            
        } else if roomList[myIndex].tolvEtt == "Opptatt", roomList[myIndex].booketAvTolvEtt == userID {
            
            prntRef.updateChildValues(["tolvEtt": "Ledig"])
            prntRef.updateChildValues(["booketAvTolvEtt": ""])
            
            
            
        } else {
            print("test")
        }
    }
    
    
    func confirmEttTo() {
        
        if roomList[myIndex].ettTo == "Ledig" {
            
            prntRef.updateChildValues(["ettTo": "Opptatt"])
            prntRef.updateChildValues(["booketAvEttTo": userID])
            
            
        } else if roomList[myIndex].ettTo == "Opptatt", roomList[myIndex].booketAvEttTo == userID {
            
            prntRef.updateChildValues(["ettTo": "Ledig"])
            prntRef.updateChildValues(["booketAvEttTo": ""])
            
            
            
        } else {
            print("test")
        }
    }
    
    func confirmToTre() {
        
        if roomList[myIndex].toTre == "Ledig" {
            
            prntRef.updateChildValues(["toTre": "Opptatt"])
            prntRef.updateChildValues(["booketAvToTre": userID])
            
            
        } else if roomList[myIndex].toTre == "Opptatt", roomList[myIndex].booketAvToTre == userID {
            
            prntRef.updateChildValues(["toTre": "Ledig"])
            prntRef.updateChildValues(["booketAvToTre": ""])
            
            
            
        } else {
            print("test")
        }
    }

    
    func confirmTreFire() {
        
        if roomList[myIndex].treFire == "Ledig" {
            
            prntRef.updateChildValues(["treFire": "Opptatt"])
            prntRef.updateChildValues(["booketAvTreFire": userID])
            
            
        } else if roomList[myIndex].treFire == "Opptatt", roomList[myIndex].booketAvTreFire == userID {
            
            prntRef.updateChildValues(["treFire": "Ledig"])
            prntRef.updateChildValues(["booketAvTreFire": ""])
            
            
            
        } else {
            print("test")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            index = indexPath.row
            
            if roomList[myIndex].booketAvTiElleve == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].tiElleve! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvTiElleve!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }
            
            
        else if indexPath.row == 1 {
            
            index = indexPath.row
            
            if roomList[myIndex].booketAvElleveTolv == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].elleveTolv! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvTiElleve!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }
            
            
        else if indexPath.row == 2 {
            
            index = indexPath.row
            
            if roomList[myIndex].booketAvTolvEtt == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].tolvEtt! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvTolvEtt!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }
            
        else if indexPath.row == 3 {
            
            index = indexPath.row
            
            if roomList[myIndex].booketAvEttTo == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].ettTo! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvEttTo!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }
            
        else if indexPath.row == 4 {
            
            index = indexPath.row
            
            if roomList[myIndex].booketAvToTre == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].toTre! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvToTre!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }

            
        else if indexPath.row == 5 {
            
            index = indexPath.row
            
            if roomList[myIndex].booketAvTreFire == userID {
                
                createAlertUnbook(title: "Avbestille?", message: "");
                
            }
            else if roomList[myIndex].treFire! == "Opptatt" {
                createAlert(title: "Rommet er opptatt", message: "Booket av " + roomList[myIndex].booketAvTreFire!)
                
            }
            else {
                createAlert(title: "Booke dette rommet?", message: roomList[myIndex].name!);
            }
            
            
        }

        
        
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
