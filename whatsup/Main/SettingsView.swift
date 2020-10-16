//
//  SettingsView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isLogged: Bool
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        NavigationLink("addjn", destination: ProfileView())
                    }

                }
            }
            .navigationTitle("Settings")
        }
    }
}

