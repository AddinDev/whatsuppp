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
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: ProfileView(user: networking.user)) {
                        Text(networking.user.name)
                    }
                    Button("Logout") {
                        try! Auth.auth().signOut()
                        self.isLogged = false
                        
                    }
                    
                    
                }
            }
            .onAppear {
                self.networking.getDataUser()
            }
            .navigationTitle("Settings")
        }
    }
}

