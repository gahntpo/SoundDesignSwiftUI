//
//  OnboardingView.swift
//  GestureProject
//
//  Created by Karin Prater on 07.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

 struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool
    
    @State private var selection: Int = 0
    
    let numberOfSlides: Int = 3

    var body: some View {
        
        VStack(spacing: 20) {
            
           OnboardingContent(selection: selection)
            
            .padding()
                .clipped()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 20))
            .padding()
                .gesture(drag)
            
            HStack(spacing: 20) {
                Button(action: {
                    self.tryDecreaseSlide()
                }) {
                    Text("Back")
                }
                
                HStack(spacing: 0) {
                    ForEach(0..<numberOfSlides, id: \.self) { number in
                        Circle()
                            .foregroundColor(number == self.selection ? Color(.gray) : Color(.lightGray))
                            .frame(width: number == self.selection ? 20 : 15, height: number == self.selection ? 20 : 15)
                            
                        .padding(5)
                        .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    self.selection = number
                                }
                               
                        }
                    }
                }
                
                Button(action: {
                    self.tryIncreaseSlide()
                }) {
                    Text(selection == numberOfSlides - 1 ? "Done" : "Next")
                }
                
            }
         
        }.accentColor(Color("Accent"))
    }
    
    func tryIncreaseSlide() {
        withAnimation {
        if selection == numberOfSlides - 1  {
            self.showOnboarding = false
        }else {
            selection += 1
        }
        }
    }
    
    func tryDecreaseSlide() {
        withAnimation {
            if selection > 0 {
                   selection -= 1
               }
        }
       
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onEnded { (value) in
                if value.translation.width > 0 {
                    self.tryDecreaseSlide()
                }else {
                    self.tryIncreaseSlide()
                }
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showOnboarding: .constant(true))
    }
}
