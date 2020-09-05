//
//  WebActiveView.swift
//  ControlViewProject
//
//  Created by Karin Prater on 14.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct WebActiveView: View {
    
    let url: URL
    
    @State private var isLoading: Bool = false
    @State private var error: Error? = nil
    
    var body: some View {
        ZStack {
       
            WebView(request: URLRequest(url: url), isLoading: $isLoading, error: $error)
            
            if isLoading {
                ActivityIndicator(isAnimating: isLoading)
            }
            
            Text(String(error?.localizedDescription ?? ""))
                .foregroundColor(Color.pink)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("", displayMode: .inline)
    }
}

struct WebActiveView_Previews: PreviewProvider {
    static var previews: some View {
        WebActiveView(url: URL(string: "https://www.apple.com")!)
    }
}
