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
    @State var sinOutput = "0.0"
    @State var Nval = "0"
    @State var error: String = "0.0"
    @State var nWhenCancel: [String] = ["0.0","0.0"]
    @State var errorInRange = "0.0"
    
    var body: some View {
        Form{
            VStack(alignment: .center){
            Text("Landau Chapter 2 ")
                    .padding(.bottom, 10)
            HStack{
                VStack (alignment: .center) {
                    Section {
                        Text("Inputs")
                        TextField("x input:", text: $xInput)
                            .padding(.horizontal)
                            .frame(width: 180)
                            .padding(.top, 0)
                            .padding(.bottom, 0)
                        Text("sin(\(xInput))")
                            .padding(.bottom, 20)
                    }
                
                    Section{
                        Text("Outputs")
                        TextField("sin(x):", text: $sinOutput)
                            .padding(.horizontal)
                            .frame(width: 180)
                            .padding(.top, 0)
                            .padding(.bottom, 0)
                    
                        TextField("Error:", text: $error)
                            .padding(.horizontal)
                            .frame(width: 180)
                            .padding(.top, 0)
                            .padding(.bottom, 0)
                    }
                    
                    Button("Calculate sin(x)", action: {self.calculateSinFromGUI()} )
                        .padding()
                }
                
                VStack(alignment: .leading){
                    Text("Problems")
                        .padding(.bottom, 2)
                    
                    Section{
                        Text("1. I wrote this code.")
                            .padding(.bottom, 2)
                    }
                    
                    Section{
                        TextField("2. Nth term to stop summation:", text: $Nval)
                            .frame(width: 230)
                            .padding(.top, 0)
                            .padding(.bottom, 2)
                    }
                    
                    Section{
                        Text("3. Observing n+1≈x/2 vs n≈x/2 term:")
                        HStack{
                            TextField("", text: $nWhenCancel[0])
                                .frame(width: 110)
                            TextField("", text: $nWhenCancel[1])
                                .frame(width: 110)
                        }
                        .padding(.bottom, 2)
                    }
                    
                    Section{
                        Text("4. Error if trig identities are used:")
                        TextField("Error:", text: $errorInRange)
                            .frame(width: 230)
                            .padding(.top, 0)
                            .padding(.bottom, 2)
                    }
                    
                    Section{
                        Text("5. At around x = 21 the series starts to lose accuracy.")
                            .frame(width: 230)
                    }
                }
                .padding(.leading, 20)
            }
            }
            .padding(.horizontal)
        }
    }
    
    /// calculateSinFromGUI
    /// Function accepts the command to start the calculation from the GUI
    func calculateSinFromGUI(){
        
        let x = Double(xInput)
        xInput = "\(x!)"
        
        let xRe = sinSumOutput.remapInputsToRange(sinXIn: x!)
        
        var sin_x = 0.0
        var sin_x_Re = 0.0
        let actualsin_x = sin(x!)
        var errorCalc = 0.0
        var errorCalcRe = 0.0
        let firstN: Int = Int(round(x!/2))
        
        //Calculate the sin with the taylor expansion
        sin_x = sinSumOutput.calculateSinExpansion(sinXIn: x!)
        sin_x_Re = sinSumOutput.calculateSinExpansion(sinXIn: xRe)

        print("The sin(\(x!)) = \(sin_x)")
        print("computer calcuates \(actualsin_x)")
        
        
        if(actualsin_x != 0.0){
            
            var numerator = sin_x - actualsin_x
            var numeratorRe = sin_x_Re - actualsin_x
            
            if(numerator == 0.0) {numerator = 1.0E-16}
            if(numeratorRe == 0.0) {numeratorRe = 1.0E-16}
            
            errorCalc = log10(abs((numerator)/actualsin_x))
            errorCalcRe = log10(abs((numeratorRe)/actualsin_x))
            
        }
        else {
            errorCalc = 0.0
            errorCalcRe = 0.0
        }
        
        sinOutput = "\(sin_x)"
        
        if (errorCalc != 0.0) {
            error = "1e\(errorCalc)"
        } else {
            error = "0.0"
        }
        
        Nval = "\(sinSumOutput.findMaxIterN(sinXIn: x!))"
        
        if(firstN > 1) {
            nWhenCancel[0] = ("\(sinSumOutput.sinXNth(sinXIn: x!, iterN: firstN))")
            nWhenCancel[1] = ("\(sinSumOutput.sinXNth(sinXIn: x!, iterN: firstN+1))")
        }
        
        if (errorCalcRe != 0.0) {
            errorInRange = "1e\(errorCalcRe)"
        } else {
            errorInRange = "0.0"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
