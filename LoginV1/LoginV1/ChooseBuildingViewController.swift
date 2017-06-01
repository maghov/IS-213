//
//  ChooseBuildingViewController.swift
//  LoginV1
//
//  Created by Magnus Høvik on 30.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import Firebase


class ChooseBuildingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var viewDropDownMenu: UIView!
    
    
//Creates a list of buildings
let buildingList = ["Bygg 47", "Bygg 48", "Bygg 49", "Bygg 50", "Bygg 51"]

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
        performSegue(withIdentifier: "seguechooseBuildingToLogin", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return buildingList.count
    }
    
    
    //Creates a row for every building in the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let buildingCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "buildingCell")
        buildingCell.textLabel?.text = buildingList[indexPath.row]
        return buildingCell
    }
    
    //Switches scene to RoomViewController when you tap a building.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueBuildingToRoom" , sender: self)
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
