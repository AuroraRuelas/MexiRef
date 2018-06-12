//
//  TPALFRA.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 1/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class TPALFRA: NSObject {
    let INFRASE = "frase"
    let IDSIG = "significado"
   var sID:String?
    var sSignificado:String?
    var sNombre:String?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[INFRASE] as? String
        sSignificado = valores[IDSIG] as? String
        
    }
    func getMap() -> [String:Any] {
        return[
            INFRASE: sNombre as Any,
            IDSIG: sSignificado as Any,
            
            
        ]
    }

   
}
