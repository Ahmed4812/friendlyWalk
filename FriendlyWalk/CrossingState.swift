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
    let SPEAK_UPDATE_TIME: TimeInterval = 5
    var lastResult:String
    var lastSpoke:Date
    
    let synthesizer = AVSpeechSynthesizer()
    
    func speak(toSay: String) {
        let utterance = AVSpeechUtterance(string: toSay)
        synthesizer.speak(utterance)
    }
        
    init(){
        lastResult = ""
        lastSpoke = Date()
    }
    
    
    func update(result: String){
        let newTime = Date()
        if #available(iOS 13.0, *) {
            print(lastSpoke.distance(to: newTime))
            if(lastSpoke.distance(to: newTime) >= SPEAK_UPDATE_TIME ||
               result != lastResult){
                lastSpoke = newTime
                lastResult = result
                speak(toSay: lastResult)
            }
            
        } else {
            lastSpoke = newTime
        }
        
    }
}


