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
        VStack {
            Button("Logout") {
                withAnimation {
                    self.isLogged = false
                }
            }
        }
    }
}

