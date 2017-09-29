//
//  main.swift
//  Kakao_04
//
//  Created by Seong ho Hong on 2017. 9. 28..
//  Copyright © 2017년 Seong ho Hong. All rights reserved.
//

import Foundation

let n = 1
let t = 1
let m = 5
let timetable = ["08:00", "08:01", "08:02", "08:03"]

func main(runBus: Int, busTerm: Int, busSize: Int) {
    let startBusTime = "09:00"
    let sortedTable = timetable.sorted() { $0 < $1 }
    
    
}

func addTimeResult(startTime: String, addTime: Int) -> String {
    let startTimeArray = Array(startTime.characters)
    
    var busTimeHour = ""
    busTimeHour.append(startTimeArray[0])
    busTimeHour.append(startTimeArray[1])
    var busTimeMin = ""
    busTimeMin.append(startTimeArray[3])
    busTimeMin.append(startTimeArray[4])
    
    //60분 이상일때 시간에 더하기
    busTimeHour = String(Int(busTimeHour)! + ((Int(busTimeMin)! + addTime) / 60))
    //남은 시간 분에 더하기
    busTimeMin = String(Int(busTimeMin)! + ((Int(busTimeMin)! + addTime) % 60))
    
    if busTimeHour.count < 2 {
        busTimeHour = "0" + busTimeHour
    }
    
    if busTimeMin.count < 2 {
        busTimeMin = "0" + busTimeMin
    }
    
    return busTimeHour + ":" + busTimeMin
}

func boardingCrew(crewTimeList: [String], busTime: String, busBoarding: Int) -> [String] {
    var busTimeInt = timeConvertInt(time: busTime)
    var boardingPeople = 0
    var crewList = crewTimeList
    
    for i in 0..<crewTimeList.count {
        var crewTimeInt = timeConvertInt(time: crewTimeList[i])
        
        //다 탓음
        if boardingPeople == busBoarding { break; }
        
        if busTimeInt[0] > crewTimeInt[0] {
            crewList.remove(at: i)
            boardingPeople += 1
        } else if busTimeInt[0] == crewTimeInt[0] && busTimeInt[1] >= crewTimeInt[1] {
            crewList.remove(at: i)
            boardingPeople += 1
        }
        
        return crewList
    }
    
    return [""]
}

func timeConvertInt(time:String) -> [Int] {
    let timeArray = Array(time.characters)
    
    var timeHour = ""
    timeHour.append(timeArray[0])
    timeHour.append(timeArray[1])
    var timeMin = ""
    timeMin.append(timeArray[3])
    timeMin.append(timeArray[4])
    
    return [Int(timeHour)!, Int(timeMin)!]
}

print(addTimeResult(startTime: "09:00", addTime: 30))
