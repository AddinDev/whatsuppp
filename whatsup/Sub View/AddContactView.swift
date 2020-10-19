//
//  AddContactView.swift
//  whatsup
//
//  Created by addjn on 19/10/20.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                })
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
