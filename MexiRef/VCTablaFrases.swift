//
//  VCTablaFrases.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 29/5/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class VCTablaFrases: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tablaFrases:UITableView?
    var arFrases:[TPALFRA] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

    
    DataHolder.sharedInstance.firestoreDB?.collection("frases").getDocuments() { (querySnapshot, err) in
        print("**************",querySnapshot!.documents)
    if let err = err {
        
    print("Error getting documents: \(err)")
    } else {
    for document in querySnapshot!.documents {
    let nombre:TPALFRA = TPALFRA()
    nombre.sID=document.documentID
    nombre.setMap(valores: document.data())
    self.arFrases.append(nombre)
    print("\(document.documentID) => \(document.data())")
    }
    print("--->",self.arFrases.count)
    self.tablaFrases?.reloadData()
        self.refreshUI()
    }
    }
    
    
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Consulta de filas para pintar")
        return arFrases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TCELLFR = tableView.dequeueReusableCell(withIdentifier: "CeldaFrases") as! TCELLFR
        cell.labelFrase?.text = arFrases[indexPath.row].sNombre
        cell.labelSignificado?.text = arFrases[indexPath.row].sSignificado
        return cell
    }
    
    
    func refreshUI(){
        
        DispatchQueue.main.async (execute:{
            self.tablaFrases?.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
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

