//
//  ContentView.swift
//  MyApp
//
//  Created by iPHTech 7 on 06/07/26.
//

import SwiftUI

// Define the gradient colors properly
let gradientTop = Color.blue
let gradientBottom = Color.purple

let gradientColors: [Color] = [
    gradientTop,
    gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
                .tag(0)
            FeaturesPage()
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
        .foregroundColor(.white)
    }
}

// for xcode v15 for later
/*
let GradientColors: [Color] = [
    gradientTop,
    gradientBottom
]

struct ContentView: View {
    var body: some View {
        
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundColor(.white)
    }
}
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
