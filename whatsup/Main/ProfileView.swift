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
            TextField("\(user.name)", text: $name, onCommit: {
                db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["name": self.name]) { error in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
            })
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}


