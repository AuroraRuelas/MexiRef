//
//  TREF.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class TREF: NSObject {
    let IREF = "refran"
    let IDSIG = "significado"
    var sID:String?
    var sSignificado:String?
    var sRefran:String?
    
    func setMap(valores:[String:Any]) {
        sRefran = valores[IREF] as? String
        sSignificado = valores[IDSIG] as? String
        
    }
    func getMap() -> [String:Any] {
        return[
            IREF: sRefran as Any,
            IDSIG: sSignificado as Any,
            
            
        ]
    }
}
