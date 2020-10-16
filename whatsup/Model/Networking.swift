//
//  Networking.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import Foundation
import Firebase

class Networking: ObservableObject {
    @Published var user = User(email: "", phone: "", name: "", imageUrl: "", status: "", statusUrl: "", statusTime: "")
    let db = Firestore.firestore()
    
    func getDataUser() {
        db.collection("User").addSnapshotListener { (querySnapshot, error) in
            
            self.user = User(email: "", phone: "", name: "", imageUrl: "", status: "", statusUrl: "", statusTime: "")
            
            if error != nil {
                print(error?.localizedDescription ?? "ewow")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String {
                            let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime)
                            self.user = user
                        }
                    }
                }
            }
        }
    }
    
}
