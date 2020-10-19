//
//  ChatList.swift
//  whatsup
//
//  Created by addjn on 19/10/20.
//

import SwiftUI

struct ChatList: View {
    var body: some View {
    
        HStack {
            Image("defaultpic")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(60)
            VStack {
                Text("name")
                Spacer()
            }.padding()
        }
        .padding(8)
        
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
