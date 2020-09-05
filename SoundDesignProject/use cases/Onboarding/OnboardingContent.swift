//
//  OnboardingContent.swift
//  GestureProject
//
//  Created by Karin Prater on 07.08.20.
//  Copyright © 2020 Karin Prater. All rights reserved.
//

import SwiftUI

struct OnboardingContent: View {
    let selection: Int
    
    var body: some View {
        GeometryReader { geometry in
          
            //MARK: - selection 0
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.9)
                    .stroke(Color.gray)
                    .frame(width: geometry.size.width / 3 * 2,
                           height: geometry.size.height / 3 * 2)
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                Circle()
                    .trim(from: 0.1, to: 0.9)
                .stroke(Color.gray)
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 2)
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                Circle()
                    .trim(from: 0.3, to: 0.7)
                .stroke(Color.gray)
                    .frame(width: geometry.size.width * 0.4,
                           height: geometry.size.height * 0.4)
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                Image(systemName: "paperplane.fill")
                .font(animatableWithSize: self.selection == 1 ? 70 : 50)
                   
                    .foregroundColor(Color("Accent"))
                    .rotationEffect(Angle.degrees(-130))
                                       .offset(CGSize(width: 0, height: geometry.size.width / 3))
                    .rotationEffect(Angle.degrees(self.selection == 1 ? 320 : 230))
                    .offset(self.offset(for: 0, to: 1, in: geometry.size))
                   
                
                Image(systemName: "paperplane")
                    .font(.system(size: 50))
                     .rotationEffect(Angle.degrees(-130))
                    .offset(CGSize(width: 0, height: geometry.size.width / 3))
                    .rotationEffect(Angle.degrees(110))
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                Image(systemName: "paperplane")
                    .font(.system(size: 50))
                     .rotationEffect(Angle.degrees(-130))
                     .offset(CGSize(width: 0, height: geometry.size.width / 3))
                    .rotationEffect(Angle.degrees(15))
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .offset(CGSize(width: 0, height: -geometry.size.height / 12))
            
            //MARK: - selection 2. things you love
            
            ZStack {
              
                Image(systemName: "aspectratio.fill")
                    .font(.system(size: geometry.size.width * 0.7))
                    .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.9))
                    .offset(CGSize(width: 0, height: -geometry.size.height / 5))
              
                
                
                Image(systemName: "gamecontroller")
                    .font(animatableWithSize: self.selection == 1 ? 45 : 0, weight: .bold)
                    .background(Color.white)
                    .offset(CGSize(width: -geometry.size.width / 5, height: geometry.size.width / 7))
                
                Image(systemName: "gift")
                    .font(animatableWithSize: self.selection == 1 ? 60 : 0, weight: .regular)
                .background(Color(hue: 0, saturation: 0, brightness: 0.9))
                     .offset(CGSize(width: -geometry.size.width / 5, height: -geometry.size.width / 4))
                
                Image(systemName: "lightbulb")
                    .font(animatableWithSize: self.selection == 1 ? 50 : 0, weight: .black)
                
               
                
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .offset(self.offset(for: 1, to: 1, in: geometry.size))
            
            
            RoundedRectangle(cornerRadius: self.selection == 1 ? 50 : 0)
                .trim(from: self.selection == 2 ? 0 : 0.22 , to: 1)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 5, dash: [20, 5], dashPhase: 0))
                .frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
            .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(self.offset(for: 1, to: 2, in: geometry.size))
            
            //MARK: - selecction 3. friends
            VStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                     .font(animatableWithSize: self.selection == 2 ? 50 : 0)
                    .background(Rectangle().fill(Color.white))
                Spacer()
                Image(systemName: "person.2")
                     .font(animatableWithSize: self.selection == 2 ? 70 : 0)
                    .foregroundColor(Color("Accent"))
                Spacer()
                Image(systemName: "person.3")
                     .font(animatableWithSize: self.selection == 2 ? 50 : 0)
                    .foregroundColor(.gray)
                 .background(Rectangle().fill(Color.white))
                
            }
               
                .animation(.spring())
                
                .padding().padding(.vertical)
                .frame(width: geometry.size.width, height: geometry.size.height * 0.7, alignment: .center)

                .frame(maxHeight: .infinity)
                .animation(Animation.spring().delay(0.2))
                .offset(self.offset(for: 2, to: 2, in: geometry.size))

            ZStack {
                VStack(spacing: 10) {
                    Text("discover amazing things").font(.headline)
                    Text("this is where you can discover new adventures").multilineTextAlignment(.center)
                }
                    //.scaleEffect(self.selection == 0 ? 1 : 0)
                    .offset(self.offset(for: 0, to: 0, in: geometry.size))
                
                Text("do things you love")
                //.scaleEffect(self.selection == 1 ? 1 : 0)
                    .offset(self.offset(for: 1, to: 1, in: geometry.size))
                
                Text("stay connected to your friends")
               // .scaleEffect(self.selection == 2 ? 1 : 0)
                    .offset(self.offset(for: 2, to: 2, in: geometry.size))
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity,
                    alignment: .bottom).padding(.bottom)
        }
    }
    
    func offset(for item: Int, to maxItem : Int, in size: CGSize) -> CGSize {
        if self.selection < item {
            //negative
            return CGSize(width: size.width, height: 0)
        }else if self.selection > maxItem {
            //postive
            return CGSize(width: -size.width, height: 0)
        }else {
            return CGSize.zero
        }
    }
    
}

struct OnboardingContent_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent(selection: 1)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
