//
//  VCTablasPalabras.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class VCTablasPalabras: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet var tablaPalabras:UITableView?
     var arPalabras:[TPAL] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        DataHolder.sharedInstance.firestoreDB?.collection("Palabras").getDocuments() { (querySnapshot, err) in
        
            if let err = err {
                
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let nombre:TPAL = TPAL()
                    nombre.sID=document.documentID
                    nombre.setMap(valores: document.data())
                    self.arPalabras.append(nombre)
                    print("\(document.documentID) => \(document.data())")
                }
                print("--->",self.arPalabras.count)
                self.tablaPalabras?.reloadData()
                self.refreshUI()
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Consulta de filas para pintar")
        return arPalabras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCELLPAL = tableView.dequeueReusableCell(withIdentifier: "CeldaPalabras") as! TVCELLPAL
        cell.labelPalabra?.text = arPalabras[indexPath.row].sPalabra
        cell.txtSig?.text = arPalabras[indexPath.row].sSignificado
        return cell
    }
    
    
    func refreshUI(){
        
        DispatchQueue.main.async (execute:{
            self.tablaPalabras?.reloadData()
        })
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


