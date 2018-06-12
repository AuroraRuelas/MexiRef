//
//  TPAL.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class TPAL: NSObject {
    let IDPalabra = "palabra"
    let IDSIG = "significado"
    var sID:String?
    var sSignificado:String?
    var sPalabra:String?
    
    func setMap(valores:[String:Any]) {
        sPalabra = valores[IDPalabra] as? String
        sSignificado = valores[IDSIG] as? String
        
    }
    func getMap() -> [String:Any] {
        return[
            IDPalabra: sPalabra as Any,
            IDSIG: sSignificado as Any,
            
            
        ]
    }
}
