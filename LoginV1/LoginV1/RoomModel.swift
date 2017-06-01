//
//  RoomModel.swift
//  RoomBooking3
//
//  Created by Mohammad Hussain on 19/04/2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//
// This class includes every field that is in the database for a room.
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
    var booketAvTiElleve: String?
    var booketAvElleveTolv: String?
    var booketAvTolvEtt: String?
    var booketAvEttTo: String?
    var booketAvToTre: String?
    var booketAvTreFire: String?
    
    
    init(id: String?, name: String?, space: String?, details: String?, tiElleve:String?,elleveTolv: String?,tolvEtt : String?, ettTo: String?,toTre: String?,treFire: String?, booketAvTiElleve: String?, booketAvElleveTolv: String?, booketAvTolvEtt: String?, booketAvEttTo: String?, booketAvToTre: String? , booketAvTreFire: String?) {
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
        self.booketAvTiElleve = booketAvTiElleve
        self.booketAvElleveTolv = booketAvElleveTolv
        self.booketAvTolvEtt = booketAvTolvEtt
        self.booketAvEttTo = booketAvEttTo
        self.booketAvToTre = booketAvToTre
        self.booketAvTreFire = booketAvTreFire
        
    }
    
}
