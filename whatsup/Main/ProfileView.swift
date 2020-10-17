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
    @Binding var isLogged: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    @State var isMissing = false
    //    @State var isDelete = false
    var body: some View {
        VStack {
            
            Form {
                Section(header: Text("name")) {
                    HStack {
                        TextField("\(user.name)", text: $name)
                    }
                }
                Section(header: Text("email")) {
                    HStack {
                        TextField("\(user.email)", text: $email)
                    }
                }
                Section(header: Text("phone")) {
                    HStack {
                        TextField("\(user.phone)", text: $phone)
                            .keyboardType(.numberPad)
                    }
                }
            }
            
        }
        //        .alert(isPresented: $isDelete, content: {
        //            Alert(title: Text("Confirmation"), message: Text("Are you sure you wanna delete this account?"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .default(Text("Yes")) { self.deleteAccount() })
        //        })
        .alert(isPresented: $isMissing, content: {
            Alert(title: Text("bruh"), message: Text("whatca trayina do?"), dismissButton: .default(Text("ok")))
        })
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("save") {self.saveData()})
    }
    
    func saveData() {
        if self.name == "" && self.phone == "" {
            self.isMissing = true
        }
        else if self.name != "" && self.phone != "" {
            db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["name": self.name, "phone": self.phone]) { error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    self.name = ""
                    self.phone = ""
                }
            }
        }
        else if self.name != "" {
            db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["name": self.name]) { error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    self.name = ""
                }
            }
        } else if self.phone != "" {
            db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["phone": self.phone]) { error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    self.phone = ""
                }
            }
        }

    }
    
    //    func deleteAccount() {
    //        Auth.auth().currentUser?.delete(completion: { (error) in
    //            if error != nil {
    //                print(error!.localizedDescription)
    //            } else {
    //                withAnimation {
    //                    self.isLogged = false
    //                }
    //            }
    //        })
    //    }
    
}



