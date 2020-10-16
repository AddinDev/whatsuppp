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
                        print("success")
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

