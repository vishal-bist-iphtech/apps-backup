//
//  ContentView.swift
//  Student-Profile-App
//
//  Created by iPHTech 7 on 07/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var email = ""
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
