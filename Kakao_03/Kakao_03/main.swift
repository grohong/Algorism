//
//  main.swift
//  Kakao_03
//
//  Created by Seong ho Hong on 2017. 9. 20..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import Foundation

let citiesList = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
let cashSize = 3

var cash:[String] = []

func getCash(city: String){
    if cash.count != cashSize {
        cash.append(city)
    } else {
        cash.remove(at: 0)
        cash.append(city)
    }
}

func soluction(cashSize: Int, cityList: [String]) -> Int {
    var runTime = 0
    
    getCash(city: cityList[0])
    runTime += 5
    
    for i in 1..<cityList.count {
      
        if cash.contains(cityList[i]) {
            runTime += 1
            getCash(city: cityList[i])
        } else {
            runTime += 5
            getCash(city: cityList[i])
        }
    }
    
    
    return runTime
}

print(soluction(cashSize: 3, cityList: citiesList))
