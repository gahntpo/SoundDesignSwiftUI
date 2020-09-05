//
//  StyleGuideButtons.swift
//  DesignProject
//
//  Created by Karin Prater on 16.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct StyleGuideButtons: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                
            }) {
                Text("simple button style")
            }.buttonStyle(SimpleButtonStyle(isDisabled: false))
            
            Button(action: {
                
            }) {
                Text("simple button style - disabled")
            }.buttonStyle(SimpleButtonStyle(isDisabled: true))
            
            Button(action: {
                
            }) {
                Text("Advanced button")
            }.buttonStyle(AdvancedButtonStyle(color: Color("Accent")))
            
            Button(action: {
                  print("advanced button pressed")
              }) {
                  Text("Advanced button")
              }.buttonStyle(AdvancedButtonStyle())
            
            Button(action: {
                print("advanced button pressed - diabled")
            }) {
                Text("Advanced button - disabled")
            }.buttonStyle(AdvancedButtonStyle(color: Color("Accent"), isDisabled: true))
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct StyleGuideButtons_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideButtons()
    }
}

struct SimpleButtonStyle: ButtonStyle {
    
    let isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(BodyText())
            .foregroundColor(Color.white)
            .padding()
            .background(accentGradient.cornerRadius(10).modifier(EShadow(elevation: configuration.isPressed ? .low : .high)))
            .saturation(isDisabled ? 0 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct AdvancedButtonStyle: PrimitiveButtonStyle {
    
    let color: Color
    let isDisabled: Bool
    
    init(color: Color = Color("Primary"), isDisabled: Bool = false) {
        self.color = color
        self.isDisabled = isDisabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .modifier(BodyText())
            .foregroundColor(isDisabled ? Color("Gray2") : color)
        .padding()
            .background(Color("Background3").cornerRadius(10).modifier(EShadow(elevation: .middle)))
            .onTapGesture {
                //print("tapped advanced")
                if !self.isDisabled {
                configuration.trigger()
                }
        }
        
    }
}
