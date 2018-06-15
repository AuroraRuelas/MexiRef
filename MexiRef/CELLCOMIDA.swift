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
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    override func setSelected(_ selected: Bool, animated: Bool){
//        super.setSelected(selected, animated: animated)
//    }
    func mostrarImagenes(uri:String) {
        self.imageC?.image = nil
        
        
        let imageReference = DataHolder.sharedInstance.firStorage?.reference(forURL:uri)
        imageReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil{
                print("ERROR !!!!!!!   ",error)
            } else{
                print("HE DESCARGADO")
                self.imagenDescargadaC = UIImage(data: data!)
                self.imageC?.image = self.imagenDescargadaC
            }
            
        }
        
   
        
    }
    
}
