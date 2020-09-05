//
//  StyleGuideColors.swift
//  DesignProject
//
//  Created by Karin Prater on 07.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

let accentGradient = LinearGradient(gradient: Gradient(colors: [Color("Accent"), Color("Primary")]), startPoint: .topLeading, endPoint: .bottomTrailing)

let primaryGradient = LinearGradient(gradient: Gradient(colors: [ Color("Primary"), Color("Secondary")]), startPoint: .topLeading, endPoint: .bottomTrailing)

struct StyleGuideColors: View {
    var body: some View {
        
        ScrollView {
        VStack(alignment: .trailing) {
            
            Text("color styles")
            
            VStack(alignment: .trailing) {
                ColorView(color: "Accent")
                ColorView(color: "Primary")
                ColorView(color: "Secondary")
                ColorView(color: "Tertary")
            }
            
            VStack(alignment: .trailing) {
                ColorView(color: "Gray1")
                ColorView(color: "Gray2")
                ColorView(color: "Gray3")
                ColorView(color: "Gray4")
            }
            
            VStack {
                Text("my background is 2")
                    .padding()
                
                Text("my background is 3")
                    .padding()
                 .background(Color("Background3"))
                
                }.padding()
            .background(Color("Background2"))
                
                
            VStack {
                HStack {
                    Text("accentGradient")
                    accentGradient.frame(width: 100, height: 50)
                }
                HStack {
                    Text("primaryGradient")
                    primaryGradient.frame(width: 100, height: 50)
                    
                }
            }
            
            
        }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color("Background1"))
        .edgesIgnoringSafeArea(.all)
       
    }
}

struct StyleGuideColors_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        StyleGuideColors()
            StyleGuideColors()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ColorView: View {
    
    let color: String
    
    var body: some View {
        HStack(spacing: 20) {
            Text(color)
            
            Text("bla bla").foregroundColor(Color(color))
            
            Color(color).frame(width: 100, height: 30)
        }
    }
}
