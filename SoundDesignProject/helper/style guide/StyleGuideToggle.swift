//
//  StyleGuideToggle.swift
//  SoundDesignProject
//
//  Created by Karin Prater on 20.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct StyleGuideToggle: View {
    @State private var isFirstActive: Bool = false
    @State private var isSecondActive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
          
            HStack {
                Toggle(isOn: $isFirstActive) {
                    Text("Primary")
                }.toggleStyle(PrimaryToggleStyle())
                
                Toggle(isOn: .constant(true)) {
                    Text("Primary")
                }.toggleStyle(PrimaryToggleStyle(lableIsHidden: true))
                
            }
            
            
            HStack {
                Toggle(isOn: $isSecondActive) {
                    Text("Secondary")
                }.toggleStyle(SecondaryToggleStyle())
                Toggle(isOn: .constant(true)) {
                    Text("Primary")
                }.toggleStyle(SecondaryToggleStyle(lableIsHidden: true))
            }
            
        }.frame(width: 260, height: 100)
    }
}

struct StyleGuideToggle_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideToggle()
    }
}


//MARK: - ToggleStyles
struct PrimaryToggleStyle: ToggleStyle {
    
    init(width: CGFloat = 50, lableIsHidden: Bool = false) {
        self.lableIsHidden = lableIsHidden
        self.width = width
    }
    
    let lableIsHidden: Bool
    let width: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            if !lableIsHidden {
                configuration.label
                #if os(iOS)
                Spacer()
                #endif
            }
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(configuration.isOn ? Color("Accent") : Color("Gray2"))
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                }
            }
        }
     
    }
}

struct SecondaryToggleStyle: ToggleStyle {
    init(lableIsHidden: Bool = false) {
        self.lableIsHidden = lableIsHidden
    }
    let lableIsHidden: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if !lableIsHidden {
            configuration.label
              Spacer()
            }
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle.fill")
                .foregroundColor(configuration.isOn ? Color("Accent") : Color("Gray2")).padding()
                
                .font(.title)
                .onTapGesture {
                    configuration.isOn.toggle()
            }

        }
    }
}
