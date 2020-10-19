//
//  SettingsView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI
import Firebase
import URLImage

struct SettingsView: View {
    @ObservedObject var networking = Networking()
    @Binding var selected: Int
    @Binding var isLogged: Bool
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    @State var imageUrl = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: ProfileView(user: networking.user, isLogged: self.$isLogged, name: self.$name, email: self.$email, phone: self.$phone, selected: self.$selected)) {
                        HStack {
                            URLImage(URL(string: self.networking.user.imageUrl) ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/whatsup-27adf.appspot.com/o/default%2Fdefaultpic.jpg?alt=media&token=3e244d8f-f9c2-4680-9c0a-ea17a450a672")!) { proxy in
                                proxy.image
                                    .resizable()
                                    .cornerRadius(60)
                            }
                            .frame(width: 60, height: 60)
                            
                            Text(networking.user.name)
                        }
                        .padding()
                    }
                    Button("Logout") {
                        try! Auth.auth().signOut()
                        withAnimation {
                            self.isLogged = false
                        }
                        self.selected = 0
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear {
                self.networking.getDataUser()
                self.name = self.networking.user.name
                self.email = self.networking.user.email
                self.phone = self.networking.user.phone
                
            }
            .navigationTitle("Settings")
        }
    }
}

