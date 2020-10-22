//
//  Networking.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import Foundation
import Firebase

class Networking: ObservableObject {
    @Published var user = User(email: "", phone: "", name: "", imageUrl: "", status: "", statusUrl: "", statusTime: "", uid: "")
    @Published var partners = [User]()
    @Published var partnerIds = [String]()
    let db = Firestore.firestore()
    
    func getDataUser() {
        self.user = User(email: "", phone: "", name: "", imageUrl: "", status: "", statusUrl: "", statusTime: "", uid: "")
        
        db.collection("User").whereField("email", isEqualTo: Auth.auth().currentUser?.email).addSnapshotListener() { (querySnapshot, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                for doc in querySnapshot!.documents {
                    
                    let data = doc.data()
                    
                    if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String, let uid = data["uid"] as? String {
                        let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime, uid: uid)
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
                    if let email = data["email"] as? String, let phone = data["phone"] as? String, let name = data["name"] as? String, let imageUrl = data["imageUrl"] as? String, let status = data["status"] as? String, let statusUrl = data["statusUrl"] as? String, let statusTime = data["statusTime"] as? String, let uid = data["uid"] as? String {
                        let user = User(email: email, phone: phone, name: name, imageUrl: imageUrl, status: status, statusUrl: statusUrl, statusTime: statusTime, uid: uid)
                        self.partners.append(user)
                        //                        self.partnerToFb(partnerId: uid)
                        
                        print("gotit")
                        
                        self.partnerToFb(partnerId: uid)
                        
                    }
                }
            }
        }
    }
    
    func partnerToFb(partnerId: String) {
        let chatRef = db.collection("Chats").document()
        let userRef = db.collection("User").document(Auth.auth().currentUser!.uid)
        let partnerRef = db.collection("User").document(partnerId)
        let batch = db.batch()
        batch.setData(["chatParticipants": [Auth.auth().currentUser!.uid, partnerId]], forDocument: chatRef)
        batch.updateData(["userChat": [Auth.auth().currentUser!.uid]], forDocument: userRef)
        batch.updateData(["userChat": [partnerId]], forDocument: partnerRef)
        batch.commit()


    }
    
    
    //    func partnerToFb(partnerId: String) {
    //        db.collection("Chats").addDocument(data: ["participant": [Auth.auth().currentUser!.uid, partnerId]])
    //        db.collection("Chats").whereField("participant", arrayContains: Auth.auth().currentUser!.uid).addSnapshotListener { (querySnapshot, error) in
    //            if error != nil {
    //                print(error!.localizedDescription)
    //            } else {
    //                for doc in querySnapshot!.documents {
    //                    let data = doc.data()
    //                    let participants = data["participant"]
    //                    self.partnerIds = participants as! [String]
    //                    print(self.partnerIds)
    //
    //                    self.db.collection("User").whereField("uid", isEqualTo: self.partnerIds)
    //
    //                    for partnerId in self.partnerIds.filter({ !$0.contains(Auth.auth().currentUser!.uid) }) {
    //                        self.db.collection("User").document(partnerId).getDocument { (document, error) in
    //                            if error != nil {
    //                                print(error!.localizedDescription)
    //                            } else {
    //                                let data = document!.data()
    //                                print(data)
    //
    //                            }
    //                        }
    //                    }
    //
    //                }
    //            }
    //        }
    //
    //    }
    
    //    func getPartner() {
    //        db.collection("Chats").whereField("participant", arrayContains: )
    //    }
    
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


