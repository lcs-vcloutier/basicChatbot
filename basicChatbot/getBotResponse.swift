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
    
    if sentimentDouble == 0.0 {
        return "Please try to keep this conversation focused on events or feelings. I'm just your neighborhood shrink after all."
    } else if sentimentDouble > 0.1 {
        return "That's great! I've seen it all so feel free to lay the hard stuff on me to."
    } else if sentimentDouble > -0.5 {
        return "That's pretty bad. Tell me more."
    } else {
        return "Wow that's just terrible. Please expand on this."
    }
}

