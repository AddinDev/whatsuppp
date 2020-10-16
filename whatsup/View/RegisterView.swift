//
//  RegisterView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @Binding var isLogged: Bool
    let db = Firestore.firestore()
    let imageDefault = "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.brandeps.com%2Ficon-download%2FP%2FPerson-outline-icon-vector-01.svg&imgrefurl=https%3A%2F%2Fwww.brandeps.com%2Ficon%2FP%2FPerson-outline-01&tbnid=sxpljAQ1TbSeFM&vet=12ahUKEwjc7ZfWkrjsAhXNMCsKHR9dDYUQMyg4egQIARBh..i&docid=t_-ocZWdW2PQcM&w=800&h=800&q=person%20logo&safe=strict&client=opera-gx&ved=2ahUKEwjc7ZfWkrjsAhXNMCsKHR9dDYUQMyg4egQIARBh"
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("name", text: $name)
                .padding()
                .background(Color(.systemGray6))
            TextField("phone", text: $phone)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
            TextField("email", text: $email)
                .padding()
                .background(Color(.systemGray6))
            SecureField("password", text: $password)
                .padding()
                .background(Color(.systemGray6))
            Button("Register") {
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (resullt, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        print("registered")
                        
                        db.collection("User").addDocument(data: [
                            "name": self.name,
                            "phone": self.phone,
                            "email": self.email,
                            "imageUrl": self.imageDefault,
                            "status": "",
                            "statusUrl": "",
                            "statusTime": ""
                        ])
                        
                        withAnimation {
                            self.isLogged = true
                            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
                        }
                    }
                }
            }
        }
    }
}

