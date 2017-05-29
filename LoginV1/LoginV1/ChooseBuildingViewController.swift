//
//  ChooseBuildingViewController.swift
//  LoginV1
//
//  Created by Magnus Høvik on 29.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit

class ChooseBuildingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let buildingList = ["Bygg 47", "Bygg 48", "Bygg 49"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (buildingList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "buildingcell")
        cell.textLabel?.text = buildingList[indexPath.row]
        
        return (cell)
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
