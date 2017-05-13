//
//  RoomModel.swift
//  RoomBooking3
//
//  Created by Mohammad Hussain on 19/04/2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

class RoomModel {
    var id: String?
    var name: String?
    var space: String?
    var details: String?
    
    init(id: String?, name: String?, space: String?, details: String?) {
        self.id = id;
        self.name = name;
        self.space = space;
        self.details = details;
    }
    
}
