//
//  OnBoardingView.swift
//  Restart
//
//  Created by Kunth Shah on 15/01/24.
//

import SwiftUI

struct OnBoardingView: View {
    
    // MARK: PROPERTY
    @AppStorage("onBoarding") var isonBoardingViewActive:Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
    
    @State private var isAnimating = false
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            VStack {
                // MARK: - HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("Wizardry.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.white)
                    
                    Text("""
                       Cast your own spells, because life's more magical when you're the wizard.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 40)
                        .frame(width: 260, height: 260, alignment: .center)
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 80)
                        .frame(width: 260, height: 260, alignment: .center)
                    
                    Image("character-3")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                } //: CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                ZStack {
                    ZStack { // MARK: LOWER VIEW
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                        
                        Capsule()
                            .fill(Color.white.opacity(0.2)).padding(8)
                        
                        Text("Launch Battle")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .offset(x: 20, y:-1)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffSet + 80)
                            Spacer()
                        }
                    } // LOWER VIEW
                    
                    HStack { // MARK: - UPPER BUTTON
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                            Capsule()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(
                                    .system(size: 24)
                                    .weight(.bold)
                                )
                        }
                        .foregroundStyle(Color.white)
                        .frame(width: 80)
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture().onChanged { gesture in
                                if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                    buttonOffSet = gesture.translation.width
                                }
                            }
                                .onEnded { _ in
                                    withAnimation(Animation.easeIn(duration: 1)) {
                                        if buttonOffSet < buttonWidth / 2 {
                                            buttonOffSet = 0
                                            isonBoardingViewActive = true
                                        }
                                        else {
                                            buttonOffSet = buttonWidth - 80
                                            isonBoardingViewActive = false
                                        }
                                    }
                                }
                        ) //: GESTURE
                        
                        Spacer()
                    } // UPPER BUTTON
                    
                }.frame(width:buttonWidth, height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x:isAnimating ? 0: 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                // FOOTER
            }
        } //: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnBoardingView()
}
