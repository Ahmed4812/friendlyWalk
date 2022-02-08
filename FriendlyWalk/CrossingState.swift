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
    var lastResult:String
    
    let synthesizer = AVSpeechSynthesizer()
    
    func speak(toSay: String) {
        let utterance = AVSpeechUtterance(string: toSay)
        synthesizer.speak(utterance)
    }
        
    init(){
        lastResult = ""
    }
    func update(result: String){
        lastResult = result
        speak(toSay: lastResult)
        
    }
}


