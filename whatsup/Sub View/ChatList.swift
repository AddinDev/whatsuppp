//
//  ChatList.swift
//  whatsup
//
//  Created by addjn on 19/10/20.
//

import SwiftUI
import URLImage

struct ChatList: View {
    var user: User
    var body: some View {
        HStack {
            URLImage(URL(string: user.imageUrl) ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/whatsup-27adf.appspot.com/o/default%2Fdefaultpic.jpg?alt=media&token=3e244d8f-f9c2-4680-9c0a-ea17a450a672")!) { proxy in
                proxy.image
                    .resizable()
                    .cornerRadius(60)
            }
            .frame(width: 60, height: 60)
            
            VStack {
                Text(user.name)
                Spacer()
            }.padding()
        }
        .padding(8)
        
    }
}

