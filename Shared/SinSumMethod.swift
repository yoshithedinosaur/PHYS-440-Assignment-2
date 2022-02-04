//
//  SinSumMethod.swift
//  Assignment 2
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import Foundation

class SinSumMethod: ObservableObject {

    @Published var threshold = 1e-7
    
    /// findMaxIterN
    /// Parameter sinXIn: finds the number of iterations maxIterN for this x values until the Nth iteration gives a value below the threshold
    /// Returns: maxIterN
    func findMaxIterN(sinXIn: Double) -> Int {
        var maxIterN: Int = 1
        var sinXN = 1.0
        while sinXN > threshold {
            sinXN = abs(sinXNth(sinXIn: sinXIn, iterN: maxIterN))
            maxIterN += 1
        }
        print("Number of iterations is \(maxIterN)")
        return maxIterN
    }
    
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
    func calculateSinExpansion(sinXIn: Double) -> Double {
        var sinX: Double = 0.0
        
        let numberOfIter: Int = findMaxIterN(sinXIn: sinXIn)
        
        for iterN in stride(from: 1, to: numberOfIter, by: 1) {
            sinX += sinXNth(sinXIn: sinXIn, iterN: iterN)
        }
        return sinX
    }
    
    /// sinXNth
    /// Parameter sinXIn, iterN: gives the Nth (iterN) term in the Taylor expansion of sin for sinXIn
    /// Return: nth term
    func sinXNth(sinXIn: Double, iterN: Int) -> Double {
        return Double(pow(-1.0, Double(iterN-1))) * Double(pow(sinXIn,Double(2*iterN-1))) / factorial(2*iterN-1)
        
    }
    
    
    /// factorial
    /// Parameter n: values of n in n!
    /// Returns: n!
    ///  n! = 1*2*3*...*(n-1)*n
    func factorial(_ n: Int) -> Double {
      return (1...n).map(Double.init).reduce(1.0, *)
    }
    
}
