//
//  AddNewEmojiView.swift
//  ArchitecturProject
//
//  Created by Karin Prater on 21.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct AddNewEmojiView: View {
    
    @State var newEmoji = ""
    
    @Binding var isPresented: Bool
    
    @ObservedObject var emojiData: EmojiDataModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("new emoji", text: $newEmoji)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.twitter)
                .padding(.bottom)
            
            Button(action: {
                self.isPresented = false
            }) {
                Text("Cancel").frame(maxWidth: .infinity)
            }.buttonStyle(AdvancedButtonStyle(color: Color("Primary")))
            
            Button(action: {
                self.emojiData.addNew(emoji: self.newEmoji)
                self.isPresented = false
            }) {
                Text("Add").frame(maxWidth: .infinity)
            }.disabled(self.newEmoji.count == 0)
                .buttonStyle(SimpleButtonStyle(isDisabled: self.newEmoji.count == 0))
            
            
            
        }
        .padding()
        .frame(minWidth: 100,idealWidth: 200, maxWidth: 300)
    }
}

struct AddNewEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewEmojiView(isPresented: .constant(false), emojiData: EmojiDataModel())
    }
}
