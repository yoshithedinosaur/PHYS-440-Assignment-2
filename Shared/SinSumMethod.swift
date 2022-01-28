//
//  SinSumMethod.swift
//  Assignment 2
//
//  Created by Yoshinobu Fujikake on 1/28/22.
//

import Foundation

/* sin expansion
                         n - 1  2n - 1
          __ N     ( - 1)      x
sin x  =  \         -------------------
          /__ n = 1      (2n - 1)!

 */

func sinSum(sinXIn: Double) -> Double {
    var sinXOut: Double = 0.0
    for iterN in stride(from: 1, to: 17, by: 1) {
        sinXOut += Double(pow(-1.0, Double(iterN-1))) * Double(pow(sinXIn,Double(2*iterN-1))) / factorial(2*iterN-1)
    }
    return sinXOut
}

// factorial function
func factorial(_ n: Int) -> Double {
  return (1...n).map(Double.init).reduce(1.0, *)
}
