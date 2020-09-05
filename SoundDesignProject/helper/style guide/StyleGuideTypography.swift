//
//  StyleGuideTypography.swift
//  DesignProject
//
//  Created by Karin Prater on 13.07.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

//h1, h2, h3, body, detail, error


struct Header1: ViewModifier {
    
    @Environment(\.sizeCategory) var sizeCategory
    let fontName: String =  "Copperplate"//"Futura"
    
    func body(content: Content) -> some View {
        switch sizeCategory {
        case .accessibilityExtraExtraExtraLarge:
            return content
                .font(.custom(fontName, size: 60))
        case .accessibilityExtraExtraLarge:
            return content
            .font(.custom(fontName, size: 56))
        case .accessibilityExtraLarge:
            return content
            .font(.custom(fontName, size: 52))
        case .accessibilityLarge:
            return content
            .font(.custom(fontName, size: 48))
        case .accessibilityMedium:
            return content
            .font(.custom(fontName, size: 44))
        case .extraExtraExtraLarge:
            return content
            .font(.custom(fontName, size: 40))
        case .extraExtraLarge:
            return content
            .font(.custom(fontName, size: 38))
        case .extraLarge:
            return content
            .font(.custom(fontName, size: 36))
        case .large:
            return content
            .font(.custom(fontName, size: 34))
        case .medium:
            return content
            .font(.custom(fontName, size: 33))
        case .small:
            return content
            .font(.custom(fontName, size: 32))
        case .extraSmall:
            return content
            .font(.custom(fontName, size: 31))

        @unknown default:
            return content
                .font(.custom(fontName, size: 35))
        }
        
    }
}

struct Header2: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.title, design: .rounded))
    }
}
struct Header3: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.subheadline, design: .rounded))
    }
}

struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.body, design: .rounded))
    }
}

struct Detail: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
         .foregroundColor(Color("Gray3"))
    }
}

struct ErrorMessage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
            .foregroundColor(Color("Error"))
    }
}

extension Text {
    public func header1() -> some View {
        return modifier(Header1())
    }
    
    public func header2() -> some View {
        return modifier(Header2())
    }
    
    public func header3() -> some View {
        return modifier(Header3())
    }
    public func bodyText() -> some View {
        return modifier(BodyText())
    }
    
    public func detailText() -> some View {
        return modifier(Detail())
    }
    
    public func errorText() -> some View {
        return modifier(ErrorMessage())
    }
}


struct StyleGuideTypography: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Typography ")
            
            
            Text("large header1 ")
                .header1()
            Text("header2")
                .header2()
            Text("header3")
                .header3()
            Text("Body")
                .bodyText()
            Text("Description")
                .detailText()
            Text("Error")
            .errorText()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct StyleGuideTypography_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideTypography()
    }
}
