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
    
let buildingList = ["Bygg 47", "Bygg 48", "Bygg 49", "Bygg 50", "Bygg 51"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return buildingList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let buildingCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "buildingCell")
        buildingCell.textLabel?.text = buildingList[indexPath.row]
        return buildingCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueBuildingToRoom" , sender: self)
    }


    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
