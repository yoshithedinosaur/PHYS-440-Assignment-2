//
//  SinSumMethod.swift
//  Assignment 2
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import Foundation

class SinSumMethod: ObservableObject {

    /// calculateSinExpansion
    /// Parameter x: values of x in sin(x)
    /// Returns: sin(x)
    /// This function does the Taylor expansion of sin
    /* sin expansion
                             n - 1  2n - 1
              __ N     ( - 1)      x
    sin x  =  \         -------------------
              /__ n = 1      (2n - 1)!

     */
    @Published var numberOfIter = 17
    func calculateSinExpansion(sinXIn: Double) -> Double {
        var sinX: Double = 0.0
        for iterN in stride(from: 1, to: numberOfIter, by: 1) {
            sinX += Double(pow(-1.0, Double(iterN-1))) * Double(pow(sinXIn,Double(2*iterN-1))) / factorial(2*iterN-1)
        }
        return sinX
    }
    
    
    /// factorial
    /// Parameter n: values of n in n!
    /// Returns: n!
    ///  n! = 1*2*3*...*(n-1)*n
    func factorial(_ n: Int) -> Double {
      return (1...n).map(Double.init).reduce(1.0, *)
    }
    
}
