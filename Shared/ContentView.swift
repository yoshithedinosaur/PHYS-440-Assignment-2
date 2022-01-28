//
//  ContentView.swift
//  Shared
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("\(sinSum(sinXIn: .pi/4))")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
