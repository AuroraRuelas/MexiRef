//
//  DataHolder.swift
//  MexiRef
//
//  Created by KARYNA AURORA RUELAS GONZALEZ on 1/6/18.
//  Copyright © 2018 AURORA RUELAS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore
//import FirebaseDatabase


class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    var firStorage:Storage?
    var firStorageRef:StorageReference?
    var fireStoreDB:Firestore?
    var arFrases:[TPALFRA] = []
    var arRefranes:[TREF] = []
    
    
    func initFirebase()  {
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
        

        
    }
    func descargarColeccionFrases() -> Bool {
        var blFin:Bool = false; DataHolder.sharedInstance.firestoreDB?.collection("frases").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                blFin=false
                
            } else {
                for document in querySnapshot!.documents {
                    let nombre:TPALFRA = TPALFRA()
                    nombre.sID=document.documentID
                    nombre.setMap(valores: document.data())
                    self.arFrases.append(nombre)
                    print("\(document.documentID) => \(document.data())")
                }
                print("--->",self.arFrases.count)
                blFin = true
            }
        }
        return blFin
    }
    
    
    

    
    func descargarColeccionRef() -> Bool {
        var blFinC:Bool = false; DataHolder.sharedInstance.firestoreDB?.collection("Refranes").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                blFinC=false
                
            } else {
                for document in querySnapshot!.documents {
                    let nombre:TREF = TREF()
                    nombre.sID=document.documentID
                    nombre.setMap(valores: document.data())
                    self.arRefranes.append(nombre)
                    print("\(document.documentID) => \(document.data())")
                }
                print("--->",self.arRefranes.count)
                blFinC = true
            }
        }
        return blFinC
    }
    
}


@objc protocol DataHolderDelegate{
    func descargarColeccionListas()
    func descargarColeccion()
    func descargarColeccionRef()
    
}

