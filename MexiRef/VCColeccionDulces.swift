//
//  VCColeccionDulces.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class VCColeccionDulces: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{


        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print("Consulta de filas para pintar")
            return self.arNombre.count;
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell:CELLDULCES = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaDulces", for: indexPath) as! CELLDULCES
            cell.lblDulce?.text = self.arNombre[indexPath.row].sNombre
            cell.mostrarImagenes(uri: self.arNombre[indexPath.row].iImagen!)
            return cell
        }
        
        
        
        @IBOutlet var COLDulces:UICollectionView?
        var arNombre:[COLDUL] = []
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            DataHolder.sharedInstance.firestoreDB?.collection("Dulces").addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arNombre=[]
                    for document in querySnapshot!.documents {
                        let nombre:COLDUL = COLDUL()
                        
                        nombre.sID=document.documentID
                        nombre.setMap(valores: document.data())
                        self.arNombre.append(nombre)
                        print("\(document.documentID) => \(document.data())")
                    }
                    print("--->",self.arNombre.count)
                    self.COLDulces?.reloadData()   
                    
                }
            }
            
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("He seleccionado" , indexPath.row)
            
        }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            print("He Deseleccionado" , indexPath.row)
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
