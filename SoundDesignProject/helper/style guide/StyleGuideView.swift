//
//  StyleGuideView.swift
//  DesignProject
//
//  Created by Karin Prater on 14.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct StyleGuideView: View {
    var body: some View {
        
        
        HStack(alignment: .top, spacing: 40) {
            VStack(spacing: 50) {
                StyleGuideColors()
                 .frame(height: 650)
                StyleGuideShadows()
                StyleGuideCard()
            }
            
            
            VStack(spacing: 30) {
                
                
                StyleGuideTypography()
                    .frame(height: 250)
                StyleGuideButtons()
                 .frame(height: 400)
                StyleGuideToggle()
                
            }
        }
            
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background1"), alignment: .center)
            .edgesIgnoringSafeArea(.all)
    }
}

struct StyleGuideView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StyleGuideView()
            StyleGuideView().environment(\.colorScheme, .dark)
            
        }.previewLayout(.fixed(width: 800, height: 1100))
    }
}
