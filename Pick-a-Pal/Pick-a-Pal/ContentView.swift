//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by iPHTech 7 on 07/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names: [String] = ["Alice", "Bob", "Catie", "Dave", "Eren"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.fill")
                    .foregroundColor(Color("AccentColor"))
                
                Text("Pick-a-Pal")
                    .bold()
            }
            .font(.title)
            .padding(.bottom)
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundColor(Color("AccentColor"))
            
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
                
            TextField("Add name", text: $nameToAdd, onCommit: {
                        if !nameToAdd.isEmpty {
                            names.append(nameToAdd)
                            nameToAdd = ""
                        }
                    }
                )
                .padding()
            .accentColor(.blue)
                
                Divider()
                
                Toggle("Remove when picked", isOn: $shouldRemovePickedName)
                
                Button {
                    if let randomName = names.randomElement() {
                        pickedName = randomName
                        
                        if shouldRemovePickedName {
                            names.removeAll { name in
                                return (name == randomName)
                            }
                        }
                    } else {
                        pickedName = " "
                    }
                } label: {
                    Text("Pick Random Name")
                        .padding(.horizontal, 8)
                        .padding(.vertical, 16)
                }
                .font(.title2)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
