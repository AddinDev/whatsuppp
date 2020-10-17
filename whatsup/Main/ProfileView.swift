//
//  ProfileView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    var user: User
    let db = Firestore.firestore()
    @State var name = ""
    var body: some View {
        VStack {
            HStack {
            TextField("\(user.name)", text: $name, onCommit: {
                self.saveData()
            })
                Button("save") {
                    self.saveData()
                }
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveData() {
        db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["name": self.name]) { error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
    
}


