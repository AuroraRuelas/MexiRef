//
//  CELLCOMIDA.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class CELLCOMIDA: UICollectionViewCell {
    @IBOutlet var imageC:UIImageView?
    @IBOutlet var lblComida:UILabel?
    var imagenDescargadaC:UIImage?
    
    func mostrarImagenes(uri:String) {
        self.imageC?.image = nil
        
        
        let imageReference = DataHolder.sharedInstance.firStorage?.reference(forURL:uri)
        imageReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil{
                
            } else{
                self.imagenDescargadaC = UIImage(data: data!)
                self.imageC?.image = self.imagenDescargadaC
            }
            
        }
        
   
        
    }
    
}
