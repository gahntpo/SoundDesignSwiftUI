//
//  StyleGuideShadows.swift
//  DesignProject
//
//  Created by Karin Prater on 08.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

// (condition) ? "true use first" : "false use second"

struct CShadow: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        return content.shadow(color: Color.black.opacity((colorScheme == .dark) ? 0.4 : 0.2), radius: 20, x: 10, y: 10)
    }
}

extension View {
    public func cShadow() -> some View {
        modifier(CShadow())
    }
}

enum Elevation {
    case low
    case middle
    case high
}

struct EShadow: ViewModifier {
    
    let elevation: Elevation
    
    func body(content: Content) -> some View {
        switch elevation {
        case .low:
            return content.shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        case .middle:
            return content.shadow(color: Color.black.opacity(0.15), radius: 10, x: 7, y: 7)
        case  .high:
            return content.shadow(color: Color.black.opacity(0.2), radius: 20, x: 10, y: 10)
        }
        
    }
}



struct StyleGuideShadows: View {
    var body: some View {
        VStack {
            Text("shadow style guide")
            RectangleTestView()
                .modifier(CShadow())
            
            RectangleTestView()
                .cShadow()
            
            RectangleTestView()
                .modifier(EShadow(elevation: .middle))
            
        }//.frame(maxWidth: .infinity, maxHeight: .infinity)
  
    }
}

struct StyleGuideShadows_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideShadows()
            .environment(\.colorScheme, .dark)
    }
}


struct RectangleTestView: View {
    var body: some View {
        Color("Background2")
            .frame(width: 100, height: 50)
           
    }
}
