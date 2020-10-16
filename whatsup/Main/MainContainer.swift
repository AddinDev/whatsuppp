//
//  Container.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI

struct MainContainer: View {
    @Binding var isLogged: Bool
    @State var selected = 0
    var body: some View {
        TabView(selection: $selected) {
            ChatsView().tabItem {
                Text("Chats")
            }.tag(0)
            SettingsView(isLogged: self.$isLogged).tabItem {
                Text("Settings")
            }.tag(1)
        }
    }
}

