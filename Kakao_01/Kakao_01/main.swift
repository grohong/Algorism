//
//  main.swift
//  Kakao_01
//
//  Created by Seong ho Hong on 2017. 9. 19..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import Foundation

let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

//let arr1 = [46, 33, 33, 22, 31, 50]
//let arr2 = [27, 56, 19, 14, 14, 10]


func changeBinaryList(list: [Int]) -> [String] {
    var binaryArray = [String]()
    
    for listItem in list {
        var num = listItem
        var binaryNum:String = ""
        
        while true {
            if num >= 2 {
                if num % 2 == 1 {
                    binaryNum.append("1")
                } else if num % 2 == 0 {
                    binaryNum.append("0")
                }
            } else {
                binaryNum.append("\(num)")
                
                if binaryNum.characters.count == arr1.count {
                    binaryArray.append(convertStringBackAndForth(string: binaryNum))
                    break
                } else {
                    let missBinaryCount = arr1.count - binaryNum.characters.count
                    var missBinary:String = ""
                    
                    for _ in 0 ..< missBinaryCount {
                        missBinary.append("0")
                    }
                    
                    missBinary.append(convertStringBackAndForth(string: binaryNum))
                    binaryArray.append(missBinary)
                    break
                }
            }
            num = num/2
        }
    }
    
    return binaryArray
}

func convertStringBackAndForth(string:String) -> String {
    var convertedString = Array(string.characters)
    
    for flag in 0 ..< string.characters.count/2 {
        let forthNum = convertedString[flag]
        let backNum = convertedString[(convertedString.count-1)-flag]
        
        convertedString[flag] = backNum
        convertedString[(convertedString.count-1) - flag] = forthNum
    }
    
    return String(convertedString)
}

let binaryArray1 = changeBinaryList(list: arr1)
let binaryArray2 = changeBinaryList(list: arr2)

func getOnePiece(binaryArray1: [String], binaryArray2: [String]) -> [String] {
    var onePiece = [String]()
    
    for index in 0 ..< binaryArray1.count {
        var array1 = Array<Character>()
        
        let charArray1 = Array(binaryArray1[index].characters)
        let charArray2 = Array(binaryArray2[index].characters)
        
        for flag in 0 ..< charArray1.count {
            if charArray1[flag] == "1"  || charArray2[flag] == "1" {
                array1.append("#")
            } else {
                array1.append(" ")
            }
        }
        
        onePiece.append(String(array1))
    }
    
    return onePiece
}

let map = getOnePiece(binaryArray1: binaryArray1, binaryArray2: binaryArray2)

print(map)
