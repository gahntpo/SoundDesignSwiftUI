//
//  StyleGuideCard.swift
//  DesignProject
//
//  Created by Karin Prater on 08.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct Card: ViewModifier {
    public func body(content: Content) -> some View {
        return content.padding()
            .background(Color("Background2").cornerRadius(10).modifier(EShadow(elevation: .high)))
            
    }
}

struct AccentCard: ViewModifier {
    public func body(content: Content) -> some View {
        return content.padding()
            .background(Color("Background3").cornerRadius(5).modifier(EShadow(elevation: .low)))
            
    }
}



struct StyleGuideCard: View {
    var body: some View {
        HStack {
            
            Text("Card modifier")
                .modifier(Card())
            
            Text("AccentCard modifier")
            .modifier(AccentCard())
        }//.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct StyleGuideCard_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideCard()
    }
}
