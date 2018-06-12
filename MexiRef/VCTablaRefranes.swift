//
//  VCTablaRefranes.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 12/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit

class VCTablaRefranes: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet var tablaRefranes:UITableView?
    var arRefranes:[TREF] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DataHolder.sharedInstance.firestoreDB?.collection("Refranes").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let nombre:TREF = TREF()
                    nombre.sID=document.documentID
                    nombre.setMap(valores: document.data())
                    self.arRefranes.append(nombre)
                    print("\(document.documentID) => \(document.data())")
                }
                print("--->",self.arRefranes.count)
                self.tablaRefranes?.reloadData()
                self.refreshUI()
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Consulta de filas para pintar")
        return arRefranes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCELLREF = tableView.dequeueReusableCell(withIdentifier: "CeldaRefranes") as! TVCELLREF
        cell.labelFrase?.text = arRefranes[indexPath.row].sRefran
        cell.txtSignificado?.text = arRefranes[indexPath.row].sSignificado
        return cell
    }
    
    
    func refreshUI(){
        
        DispatchQueue.main.async (execute:{
            self.tablaRefranes?.reloadData()
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


