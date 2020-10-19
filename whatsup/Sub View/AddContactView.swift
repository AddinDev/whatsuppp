//
//  AddContactView.swift
//  whatsup
//
//  Created by addjn on 19/10/20.
//

import SwiftUI
import Firebase

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var phone = ""
    @State var result = ""
    let db = Firestore.firestore()
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("phone")) {
                        
                        HStack {
                            TextField("phone number", text: $phone)
                                .keyboardType(.numberPad)
                            Button("Check") {
                                self.check()
                            }
                        }
                        
                    }
                    if self.result == "ada co" {
                        Text("\(self.result)")
                            .foregroundColor(.green)
                    } else if self.result == "gada co" {
                        Text("\(self.result)")
                            .foregroundColor(.red)
                    }
                }
                Spacer()
            }
            .navigationBarItems(trailing: Button("Save") {
                self.presentationMode.wrappedValue.dismiss()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
            })
        }
    }
    
    func check() {
        db.collection("User").whereField("phone", isEqualTo: self.phone).getDocuments { (querySnapshot, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if querySnapshot!.documents.count > 0 {
                    self.result = "ada co"
                } else {
                    self.result = "gada co"
                }
            }
        }
    }
    
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
