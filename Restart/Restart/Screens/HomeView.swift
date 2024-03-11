//
//  HomeView.swift
//  Restart
//
//  Created by Kunth Shah on 15/01/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: PROPERTIES
    
    @AppStorage("onBoarding") var isOnBoardingViewActive:Bool = false
    @State private var isAnimating = false
    
    // MARK: BODY
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: - IMAGE SECTION
        
            ZStack {
                Circle().stroke(Color.gray.opacity(0.1), lineWidth: 40)
                    .frame(width: 240)
                Circle().stroke(Color.gray.opacity(0.2), lineWidth: 70)
                    .frame(width: 240)
                Image("character-4")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -10 )
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever(),
                        value: isAnimating
                    )
            } // IMAGE SECTION
            
            
            // MARK: - CENTER TEXT
            Text("""
                The time that leads to mastery is
                dependant on the intensity of the focus.
            """)
            .font(.system(size: 20))
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            
            Spacer()
            // MARK: - FOOTER BUTTON
            
            Button(action: {
                withAnimation {
                    isOnBoardingViewActive = true
                }
            }, label: {
                HStack {
                    Image(systemName: "repeat.circle.fill").foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                    Text("Restart")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20))
                }
                .background(Capsule().fill(Color("ColorBlue")))
            })
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
