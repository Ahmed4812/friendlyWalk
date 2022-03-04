//
//  CrossingState.swift
//  FriendlyWalk
//
//  Created by Ali Ahmed Khan on 2/7/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import AVFoundation

class CrossingState{
    let SPEAK_UPDATE_TIME: TimeInterval = 3
    let LAST_UPDATE_THRESHOLD: TimeInterval = 10
    let CONFIRMATION_CNT: Int = 3
    let GO_REPEAT: Int = 10
    
    var lastResult:String
    var lastUpdate:Date
    var lastSpoke:Date
    var confirmCnt:Int
    
    enum States{
        case initial, wait1, wait2, confirmation, go
    }
    var prevState: States = .initial
    var currentState: States = .initial
    
    
    func speak(toSay: String) {
        lastSpoke = Date()
        synthSpeak(toSay: toSay)
    }
        
    init(){
        lastResult = ""
        lastSpoke = Date()
        lastUpdate = Date()
        confirmCnt=0
    }
    
    
    func stateWiseUpdate(result: String){
        let nowTime = Date()
        if #available(iOS 13.0, *) {
            switch currentState{
            case .initial:
                if result == "red"{
                    currentState = .wait1
                    lastUpdate = nowTime
                    
                    speak(toSay: result)
                    speak(toSay: "Please Wait")
                    break
                }else if result == "green"{
                    currentState = .wait2
                    lastUpdate = nowTime

                    speak(toSay: result)
                    speak(toSay: "Please Wait")

                    break
                }
                if(lastSpoke.distance(to: nowTime) >= SPEAK_UPDATE_TIME){
                    speak(toSay: "Can't detect")
                }
                break
              
            case .wait1:
                if result == "green"{
                    confirmCnt+=1
                    if confirmCnt>=2{
                        currentState = .wait2
                        lastUpdate=nowTime
                        speak(toSay: result)
                        speak(toSay: "Please Wait")
                        confirmCnt = 0
                    }
                    break
                }else if result == "red"{
                    confirmCnt=0
                    if(lastSpoke.distance(to: nowTime) >= SPEAK_UPDATE_TIME){
                        speak(toSay: result)
                        speak(toSay: "Please Wait")
                        lastUpdate=nowTime
                        break
                    }
                }else{
                    print("Some other detection")
                }
                if (lastUpdate.distance(to: nowTime) > LAST_UPDATE_THRESHOLD){
                    currentState = .initial
                }
                break
                
            case .wait2:
                if result == "red"{
                    confirmCnt+=1
                    if confirmCnt>=2{
                        currentState = .confirmation
                        speak(toSay: result)
                        speak(toSay: "Please Wait")
                        lastUpdate=nowTime
                        confirmCnt = 0
                    }
                    break
                }else if result == "green"{
                    confirmCnt=0
                    if(lastSpoke.distance(to: nowTime) >= SPEAK_UPDATE_TIME){
                        speak(toSay: result)
                        speak(toSay: "Please Wait")
                        lastUpdate=nowTime
                        break
                    }
                }else{
                    print("Some other detection")
                }
                if (lastUpdate.distance(to: nowTime) > LAST_UPDATE_THRESHOLD){
                    currentState = .initial
                }
                break
            case .confirmation:
                if (result == "red"){
                    confirmCnt+=1
                    lastUpdate = nowTime
                    speak(toSay: "confirming")
                }
                if confirmCnt >= CONFIRMATION_CNT{
                    currentState = .go
                    confirmCnt = 0
                    break
                }
                
                if (lastUpdate.distance(to: nowTime) > LAST_UPDATE_THRESHOLD){
                    currentState = .initial
                }
                break
                
            case .go:
                if confirmCnt < GO_REPEAT{
                    if(lastSpoke.distance(to: nowTime) >= SPEAK_UPDATE_TIME){
                        speak(toSay: "Go!")
                        lastUpdate=nowTime
                        confirmCnt+=1
                    }
                    break
                }
            }
        
            
            

            
        } else {

        }
        
    }
    
    func update(result: String){
        let newTime = Date()
        if #available(iOS 13.0, *) {
            if((lastSpoke.distance(to: newTime) >= SPEAK_UPDATE_TIME) ||
               result != lastResult){
                if (result=="red" || result == "green"){
                    lastResult = result
                    speak(toSay: lastResult)
                }
            }
            
        } else {
            lastSpoke = newTime
        }
    }
}


