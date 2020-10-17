//
//  SettingsView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @ObservedObject var networking = Networking()
    @Binding var isLogged: Bool
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: ProfileView(user: networking.user, isLogged: self.$isLogged, name: self.$name, email: self.$email, phone: self.$phone)) {
                        Text(networking.user.name)
                    }
                    Button("Logout") {
                        try! Auth.auth().signOut()
                        withAnimation {
                            self.isLogged = false
                        }
                    }
                }
            }
            .onAppear {
                self.networking.getDataUser()
                self.name = self.networking.user.name
                self.email = self.networking.user.email
                self.email = self.networking.user.phone
            }
            .navigationTitle("Settings")
        }
    }
}

