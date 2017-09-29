//
//  main.swift
//  Kakao_CodeFestival_01
//
//  Created by Seong ho Hong on 2017. 9. 25..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    var avgMin: Float? = nil
    var minIndex: Int? = nil
    var sum = 0
    var avg: Float = 0
    
//    for i in 0..<A.count {
//        for j in i+1..<A.count{
//            for numIndex in i...j {
//                sum += A[numIndex]
//            }
//
//            avg = Float(Float(sum)/Float(((j-i)+1)))
//            if avgMin == nil || avgMin! > avg {
//                avgMin = avg
//                minIndex = i
//            }
//            sum = 0
//            avg = 0
//        }
//    }
    var plusList: [Int] = []
    
    for i in 0..<A.count {
        sum += A[i]
        plusList.append(sum)
    }
    
    
    
    return minIndex!
}

var exampl = [4, 2, 2, 5, 1, 5, 8]

print(solution(&exampl))
