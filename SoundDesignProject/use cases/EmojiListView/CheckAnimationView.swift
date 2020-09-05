//
//  CheckAnimationView.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct CheckAnimationView: View {
    let isShown: Bool
    
    var body: some View {
        
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(Color("Accent"))
                .background(Circle().fill(Color("Background3")))
                .scaleEffect(isShown ? 1 : 0)
                .animation(Animation.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 4).delay(0.5))
                
                .offset(x: 0, y: -50)
            
            Text("Success")
        }
    }
}

struct CheckAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnimationView(isShown: true)
    }
}
