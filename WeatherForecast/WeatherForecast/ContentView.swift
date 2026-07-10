//
//  ContentView.swift
//  WeatherForecast
//
//  Created by iPHTech 7 on 06/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Weather Forecast")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            HStack {
                StatsCard(day: "Mon", high: 70, low: 50, icon: "sun.max.fill", color: .yellow)
                StatsCard(day: "Tue", high: 60, low: 40, icon: "cloud.rain.fill", color: .blue)
            }
            
        }
    }
}

struct StatsCard: View {
    let day: String
    let high: Int
    let low: Int
    let icon: String
    let color: Color
    var body: some View {
        
        
        VStack {
            
            Text(day)
                .font(.headline)
            
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(color)
                .padding(5)
            
            Text("High: \(high)")
                .fontWeight(.semibold)
            
            Text("Low: \(low)")
                .fontWeight(.medium)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
