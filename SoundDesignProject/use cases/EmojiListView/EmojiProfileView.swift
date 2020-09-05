//
//  EmojiProfileView.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct EmojiProfileView: View {
    
    let emoji: String
    
    @State private var showMessage: Bool = false

    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                Text("Emoji!")
                Text(emoji)
                    .font(.system(size: 120))
                
                Button(action: {
                    withAnimation(.linear(duration: 0.5)) {    self.showMessage.toggle()
                    }
                    
                }) {
                    Text("Add to Favorites")
                }
   
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background1"))
            .blur(radius: showMessage ? 10 : 0)
            .brightness(showMessage ? -0.2 : 0)
            
            //MARK: - overlay
            GeometryReader { geometry in
                
               // GameAppSuccess(isAnimating: self.showMessage)
               //     .frame(width: 300, height: 300)
               CheckAnimationView(isShown: self.showMessage)
                    .padding().modifier(Card())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    .opacity(self.showMessage ? 1 : 0)
                    .offset(x: 0, y: self.showMessage ? 0 : -geometry.size.height / 2)
                
            }.onTapGesture {
                withAnimation(.linear(duration: 0.4)) {
                    self.showMessage.toggle()
                }
            }
            
            
        }
    }
}

struct EmojiProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiProfileView(emoji: "☺️")
    }
}
