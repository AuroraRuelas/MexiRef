//
//  COLDUL.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class COLDUL: NSObject {
    let IDNOMBRE = "nombre"
    let IDIMAGEN = "imagen"
    var sID:String?
    var sNombre:String?
    var iImagen:String?
    
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDNOMBRE] as! String
        iImagen = valores[IDIMAGEN] as! String
    }
    func getMap() -> [String:Any] {
        return[
            IDNOMBRE: sNombre as Any,
            IDIMAGEN: iImagen as Any
        ]
    }
}
