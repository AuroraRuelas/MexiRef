//
//  CELLDULCES.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class CELLDULCES: UICollectionViewCell {
    @IBOutlet var imageD:UIImageView?
    @IBOutlet var lblDulce:UILabel?
    var imagenDescargadaD:UIImage?
    
    func mostrarImagenes(uri:String) {
        self.imageD?.image = nil
        let imageReference = DataHolder.sharedInstance.firStorage?.reference(forURL:uri)
        imageReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil{
                
            } else{
                self.imagenDescargadaD = UIImage(data: data!)
                self.imageD?.image = self.imagenDescargadaD
            }
            
        }
        
        
        
    }
}
