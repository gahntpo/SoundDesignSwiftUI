//
//  EmojiList.swift
//  ArchitecturProject
//
//  Created by Karin Prater on 21.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct EmojiList: View {
    
    @ObservedObject var emojiData = EmojiDataModel()
    
    @State var popOverShown: Bool = false
    @State var shownDeleteAlert: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(emojiData.emojis, id: \.self) { item in
                    NavigationLink(destination: EmojiProfileView(emoji: item)) {
                         Text(item)
                    }
                }
            
                .onDelete { (indices) in
                    self.emojiData.requestedDeleteEmojis = indices
                    self.shownDeleteAlert.toggle()
                    //self.emojiData.delete(indices: indices)
                }
               
            }
            .accentColor(Color.green)
                
            .navigationBarTitle("Emojis")
            .navigationBarItems(trailing: Button(action: {
                self.popOverShown = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                
            }).popover(isPresented: $popOverShown) {
                AddNewEmojiView(isPresented: self.$popOverShown, emojiData: self.emojiData)
            })
            
            .alert(isPresented: $shownDeleteAlert) {
                Alert(title: Text("You really want to delete \(self.emojiData.emojoToDelet())"), primaryButton: Alert.Button.cancel(), secondaryButton: .destructive(Text("delete"), action: {
                    self.emojiData.delete()
                //print("delete very important info")
            }))
            }
            
         
        }
    }
}

struct EmojiList_Previews: PreviewProvider {
    static var previews: some View {
        EmojiList()
    }
}
