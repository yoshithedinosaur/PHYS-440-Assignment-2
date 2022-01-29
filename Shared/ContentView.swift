//
//  ContentView.swift
//  Shared
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    @State var sinInput: String = "0"
    
    var body: some View {
        Text("Sin expansion")
        TextField("Value to evaluate:", text: $sinInput, onCommit: {Task.init {await self.calculateSinSum()}})
            .padding(.horizontal)
            .frame(width: 100)
            .padding(.top, 0)
        Text("Sin(\(sinInput) )= \()")
    }
    
    func calculateSinSum() async {
        var displayVal: Double = sinSum(sinXIn: Double(sinInput)!)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
