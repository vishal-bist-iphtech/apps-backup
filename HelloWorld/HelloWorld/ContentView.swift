//
//  ContentView.swift
//  HelloWorld
//
//  Created by iPHTech 7 on 06/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var titleColor: Color = .black
    var body: some View {
        VStack
        {
            Image(systemName: "swift")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundColor(.red)
            
            Text("Hello, World!")
                .foregroundColor(titleColor)
                .font(.title)
                .padding()
            
            HStack
            {
                myButton(text:"Red", color: Color.red){
                    titleColor = .red
                }
                
                myButton(text:"Green", color: Color.green){
                    titleColor = .green
                }
                
                myButton(text:"Blue", color: Color.blue){
                    titleColor = .blue
                }
            }
        }
    }
}

struct myButton: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            
            Text(text)
                .padding()
                .background(color)
                .cornerRadius(8)
        }
        .padding()
        .foregroundColor(.black)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
