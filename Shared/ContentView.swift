//
//  ContentView.swift
//  Shared
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expandedSin: Double = 0.0
    
    var body: some View {
        Form {
            Section {
                TextField("Input to Sin", text: $expandedSin, onCommit: {Task.init {await self.calculateSinExpansion()}})
            }
        }
    }
}

func calculateSinExpansion() async {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
