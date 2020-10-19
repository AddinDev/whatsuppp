//
//  ChatsView.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import SwiftUI

struct ChatsView: View {
    @State var isAddContact = false
    var body: some View {
        NavigationView {
            ZStack {
                List(1..<3) {_ in
                    ChatList()
                }
                .listStyle(PlainListStyle())
                
                NewChatButton(isAddContact: self.$isAddContact)
                
            }
            .navigationTitle("Chats")
            .sheet(isPresented: $isAddContact) {
                AddContactView()
            }
        }
    }
}

struct NewChatButton: View {
    @Binding var isAddContact: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.isAddContact = true
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color(.systemGray6))
                            .padding()
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                
            }
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
