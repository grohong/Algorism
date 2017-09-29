//
//  main.swift
//  Kakao_02
//
//  Created by Seong ho Hong on 2017. 9. 19..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import Foundation

let score1 = "1S2D*3T"
let score2 = "1D2S#10S"
let score3 = "1D2S0T"
let score4 = "1S*2T*3S"
let score5 = "1D#2S*3S"
let score6 = "1T2D3D#"
let score7 = "1D2S3T*"

func parseScore(score: String) -> [String] {
    var scoreList = [String]()
    let scoreArray = Array(score.characters)
    
    for index in 0 ..< scoreArray.count {
         var chunk = ""
        
        if (index == scoreArray.count-2)
            && (scoreArray[index]=="S" || scoreArray[index]=="D" || scoreArray[index]=="T"){
            if index > 1 && (scoreArray[index-2] == "1" && scoreArray[index-1] == "0"){
                chunk.append(scoreArray[index-2])
            }
            chunk.append(scoreArray[index-1])
            chunk.append(scoreArray[index])
            chunk.append(scoreArray[index+1])
            
            scoreList.append(chunk)
            break
        } else if (index == scoreArray.count-1)
            && (scoreArray[index]=="S" || scoreArray[index]=="D" || scoreArray[index]=="T"){
            if index > 1 && (scoreArray[index-2] == "1" && scoreArray[index-1] == "0"){
                chunk.append(scoreArray[index-2])
            }
            
            chunk.append(scoreArray[index-1])
            chunk.append(scoreArray[index])
            
            
            scoreList.append(chunk)
            break
        }
        
        
        if (scoreArray[index]=="S" || scoreArray[index]=="D" || scoreArray[index]=="T")
            && (scoreArray[index+1]=="*" || scoreArray[index+1]=="#") {
            if index > 1 && (scoreArray[index-2] == "1" && scoreArray[index-1] == "0"){
                chunk.append(scoreArray[index-2])
            }
            chunk.append(scoreArray[index-1])
            chunk.append(scoreArray[index])
            chunk.append(scoreArray[index+1])
            
            scoreList.append(chunk)
        } else if (scoreArray[index]=="S" || scoreArray[index]=="D" || scoreArray[index]=="T")
            && (scoreArray[index+1] != "*" || scoreArray[index+1] != "#") {
            if index > 1 && (scoreArray[index-2] == "1" && scoreArray[index-1] == "0"){
                chunk.append(scoreArray[index-2])
            }
            chunk.append(scoreArray[index-1])
            chunk.append(scoreArray[index])

            
            scoreList.append(chunk)
        }
    }
    
    return scoreList
}

func scoreOfList(scoreList: [String]) -> Int {
    var chunkList = [Int]()
    
    for chunk in scoreList {
        let chunkArray = Array(chunk.characters)
        var num = 0
        
        if (chunkArray[1]=="S" || chunkArray[1]=="D" || chunkArray[1]=="T") {
            num = Int(String(chunkArray[0]))!
        } else if (chunkArray[2]=="S" || chunkArray[2]=="D" || chunkArray[2]=="T") {
            num = 10
        }
        
        if chunkArray[1]=="D" || chunkArray[chunkArray.count-1]=="D" || chunkArray[chunkArray.count-2]=="D" {
            num = num*num
        } else if chunkArray[1]=="T" || chunkArray[chunkArray.count-1]=="T" || chunkArray[chunkArray.count-2]=="T"{
            num = num*num*num
        }
        
        if chunkArray[chunkArray.count-1]=="#" {
            num = -num
        }
        
        chunkList.append(num)
        
        if chunkArray[chunkArray.count-1]=="*" {
            chunkList = chunkList.map{ $0 * 2 }
        }
    }
    
    return chunkList.reduce(0) { $0 + $1 }
}


print(scoreOfList(scoreList: parseScore(score: score1)))
print(scoreOfList(scoreList: parseScore(score: score2)))
print(scoreOfList(scoreList: parseScore(score: score3)))
print(scoreOfList(scoreList: parseScore(score: score4)))
print(scoreOfList(scoreList: parseScore(score: score5)))
print(scoreOfList(scoreList: parseScore(score: score6)))
print(scoreOfList(scoreList: parseScore(score: score7)))
