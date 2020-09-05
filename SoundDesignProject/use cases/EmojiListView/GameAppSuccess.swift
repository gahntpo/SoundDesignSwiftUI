//
//  GameAppSuccess.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct GameAppSuccess: View {
    let isAnimating: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                Text("You won!!!")
                    .font(.title)
                    .foregroundColor(Color("Accent"))
                 .scaleEffect(self.isAnimating ? 2 : 0)
                    .animation(Animation.spring().delay(1))
                
                Image(systemName: "star")
                    .font(.system(size: 60))
                    .foregroundColor(Color("Primary"))
                    .rotationEffect(.init(degrees: self.isAnimating ? 360 : 0))
                    .offset(x: self.isAnimating ? geometry.size.width / 4 : -50, y: self.isAnimating ? -geometry.size.width / 4 : -10)
                
                
                Circle().stroke(Color("Accent"), lineWidth: 5)
                    .frame(width: 50, height: 50)
                    .scaleEffect(self.isAnimating ? 2 : 0)
                    .offset(x: self.isAnimating ? 0 : geometry.size.width / 3 , y: geometry.size.height / 5)
                    


                Image(systemName: "star")
                .font(.system(size: 50))
                .foregroundColor(Color("Secondary"))
                 .scaleEffect(self.isAnimating ? 2 : 0)
                  .offset(x: self.isAnimating ? -geometry.size.width / 4 : 0, y: -geometry.size.height / 3)


                Circle().stroke(Color("Accent"), lineWidth: 5)
                 .frame(width: 50, height: 50)
                    .opacity(self.isAnimating ? 1 : 0)
                .offset(x: self.isAnimating ? geometry.size.width / 4 : 0, y: -geometry.size.height / 3)
                
            }
        }    .animation(isAnimating ? Animation.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 4).repeatForever() : Animation.default)
       
    }
}

struct GameAppSuccess_Previews: PreviewProvider {
    static var previews: some View {
        GameAppSuccess(isAnimating: true)
    }
}
