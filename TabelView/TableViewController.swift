//
//  TableViewController.swift
//  pickerView
//
//  Created by Magnus Høvik on 19.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit

var rooms  = ["Rom 101", "Rom 102", "Rom 103"]

var desc = ["Har plass til 10", "Har plass til 5", "Har plass til 12"]
var myIndex = 0

class TableViewController: UITableViewController {

    @IBOutlet weak var textlabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = rooms[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
