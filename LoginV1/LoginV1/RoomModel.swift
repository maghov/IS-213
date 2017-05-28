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
    var tiElleve: String?
    var elleveTolv: String?
    var tolvEtt : String?
    var ettTo: String?
    var toTre: String?
    var treFire: String?

    
    init(id: String?, name: String?, space: String?, details: String?, tiElleve:String?,elleveTolv: String?,tolvEtt : String?, ettTo: String?,toTre: String?,treFire: String?) {
        self.id = id;
        self.name = name;
        self.space = space;
        self.details = details;
        self.tiElleve = tiElleve;
        self.elleveTolv = elleveTolv
        self.tolvEtt = tolvEtt
        self.ettTo = ettTo
        self.toTre = toTre
        self.treFire = treFire
    }
    
}
