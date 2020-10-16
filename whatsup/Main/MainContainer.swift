//
//  Container.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI

struct MainContainer: View {
    @Binding var isLogged: Bool
    @State var selected = 1
    var body: some View {
        TabView(selection: $selected) {
            StatusView().tabItem {
                Text("Status")
            }.tag(0)
            ChatsView().tabItem {
                Text("Chats")
            }.tag(1)
            SettingsView(isLogged: self.$isLogged).tabItem {
                Text("Settings")
            }.tag(2)

        }
    }
}

