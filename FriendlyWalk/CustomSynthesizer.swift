//
//  CustomSynthesizer.swift
//  FriendlyWalk
//
//  Created by Ali Ahmed Khan on 3/3/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import AVFoundation

let synthesizer = AVSpeechSynthesizer()

func synthSpeak(toSay: String) {
    let utterance = AVSpeechUtterance(string: toSay)
    synthesizer.speak(utterance)
}
