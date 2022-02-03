//
//  ContentView.swift
//  Shared
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sinSumOutput = SinSumMethod()
    @State var xInput = "0.0"
    @State var error: String = "0.0"
    
    var body: some View {
        Form {
            Section {
                TextField("Input to Sin", text: $xInput)
                .padding()
            }
        }
        HStack{
            Button("Calculate sin(x)", action: {self.calculateSinFromGUI()} )
            .padding()
            
        }
    }
    
    /// calculateCos_X
    /// Function accepts the command to start the calculation from the GUI
    func calculateSinFromGUI(){
        
        let x = Double(xInput)
        xInput = "\(x!)"
        
        var sin_x = 0.0
        let actualsin_x = sin(x!)
        var errorCalc = 0.0
        
        //Calculate the new plotting data and place in the plotDataModel
        sin_x = sinSumOutput.calculateSinExpansion(sinXIn: x!)

        print("The sin(\(x!)) = \(sin_x)")
        print("computer calcuates \(actualsin_x)")
        
        if(actualsin_x != 0.0){
            
            var numerator = sin_x - actualsin_x
            
            if(numerator == 0.0) {numerator = 1.0E-16}
            
            errorCalc = log10(abs((numerator)/actualsin_x))
            
        }
        else {
            errorCalc = 0.0
        }
        
        error = "\(errorCalc)"
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
