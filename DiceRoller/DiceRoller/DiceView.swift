//
//  DiceView.swift
//  DiceRoller
//
//  Created by iPHTech 7 on 07/07/26.
//

import SwiftUI

struct DiceView: View {
    
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        
        VStack {
            Image(systemName: "die.face.\(numberOfPips)")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(1,contentMode: .fit)
                .foregroundColor(.black)
            
            Divider()
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .padding()
            .background(Color.gray)
            .font(.title)
            .cornerRadius(10)
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
