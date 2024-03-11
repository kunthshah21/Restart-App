//
//  ContentView.swift
//  Restart
//
//  Created by Kunth Shah on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoarding") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                OnBoardingView()
            }
            else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
