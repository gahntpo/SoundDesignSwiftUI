//
//  ActivityIndicator.swift
//  ControlViewProject
//
//  Created by Karin Prater on 14.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    
    let isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.color = UIColor.gray
        indicator.style = .large
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        }else {
            uiView.stopAnimating()
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isAnimating: true)
    }
}
