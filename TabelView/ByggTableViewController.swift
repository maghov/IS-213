//
//  ByggTableViewController.swift
//  pickerView
//
//  Created by Magnus Høvik on 21.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit

var bygg = ["47", "48", "49"]


class ByggTableViewController: UITableViewController {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return bygg.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
    
    
    cell.textLabel?.text = bygg[indexPath.row]
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    myIndex = indexPath.row
    performSegue(withIdentifier: "segue1", sender: self)
        }

}
