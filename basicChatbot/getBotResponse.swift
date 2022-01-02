//
//  getBotResponse.swift
//  basicChatbot
//
//  Created by Vincent Cloutier on 2021-12-31.
//

import Foundation
import NaturalLanguage


func getBotResponse(message: String) -> String {
    let text = message.lowercased()
    var realSentiment = ""
    let tagger = NLTagger(tagSchemes: [.tokenType, .sentimentScore])
    tagger.string = text
    
    tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph,
                         scheme: .sentimentScore, options: []) { sentiment, _ in
        
        if let sentimentScore = sentiment {
            realSentiment = sentimentScore.rawValue
            
            print(sentimentScore.rawValue)
        }
        return true
    }
    
    
    let sentimentDouble = Double(realSentiment)!
    let neutralReplies = [
        "Please try to keep this conversation focused on events or feelings. I'm just your neighborhood shrink after all.",
        "neutral 2",
        "neutral 3",
        "neutral 4",
        "neutral 5"
    ]
    let positiveReplies = [
        "That's great! I've seen it all so feel free to lay the hard stuff on me to.",
        "positive 2",
        "positive 3",
        "positive 4",
        "positive 5",
        "positive 6",
        "positive 7",
        "positive 8",
        "positive 9",
        "positive 10",
        "positive 11",
        "positive 12",
        "positive 13",
    ]
    let negativeReplies = [
        "Wow that's just terrible. Please expand on this.",
        "negative 2",
        "negative 3",
        "negative 4",
        "negative 5"
    ]
    
    if sentimentDouble == 0.0 {
        return neutralReplies.randomElement()!
    } else if sentimentDouble > 0.1 {
        return positiveReplies.randomElement()!
    } else {
        return negativeReplies.randomElement()!
    }
}
