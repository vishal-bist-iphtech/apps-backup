//
//  ContentView.swift
//  DiceRoller
//
//  Created by iPHTech 7 on 07/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.system(size: 50))
                .foregroundColor(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) {_ in
                    DiceView()
                }
            }
            .padding(.bottom)
            
            HStack {
                Button("Remove Dice") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                    
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .disabled(numberOfDice==1)
                
                Button("Add Dice") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .disabled(numberOfDice==4)
                
            }
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppBackground"))
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
