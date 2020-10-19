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
    @Published var partners = [User]()
    let db = Firestore.firestore()
    
    func getDataUser() {
        self.user = User(email: "", phone: "", name: "", imageUrl: "", status: "", statusUrl: "", statusTime: "")
        
        db.collection("User").whereField("email", isEqualTo: Auth.auth().currentUser?.email).addSnapshotListener() { (querySnapshot, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                for doc in querySnapshot!.documents {
                    
                    let data = doc.data()
                    
                    if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String {
                        let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime)
                        self.user = user
                    }
                }
            }
        }
    }
    
    func savePartner(phone: String) {
        db.collection("User").whereField("phone", isEqualTo: phone).getDocuments { (querySnapshot, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                for doc in querySnapshot!.documents {
                    let data = doc.data()
                    if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String {
                        let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime)
                        self.partners.append(user)
                            print("gotit")
                    }
                }
            }
        }
    }
}


//            if error != nil {
//                print(error?.localizedDescription ?? "ewow")
//            } else {
//                if let snapshotDocuments = querySnapshot?.documents {
//                    for doc in snapshotDocuments {
//                        let data = doc.data()
//                        if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String {
//                            let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime)
//                            self.user = user
//                        }
//                    }
//                }
//            }


