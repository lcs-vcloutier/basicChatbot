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
    let neutralRepliesStart = [
        "Please try to keep this conversation focused on events or feelings.",
        "Let's refocus this conversation on your emotions.",
        "Please focus on what you're really feeling.",
        "Elaborate on how you really feel.",
        "Let's explore your underlying emotions or the root of the problem."
    ]
    
    let neutralRepliesEnd = [
        "I'm just your neighborhood shrink after all.",
        "I'm not prepared to handle small talk.",
        "You don't pay me to talk pleasantries.",
        "I'm not a fan of small talk.",
        "We shouldn't waste your time on idle conversation or chit-chat."
    ]

    let positiveRepliesStart = [
        "I see.",
        "I understand.",
        "That's good no?",
        "That's interesting.",
        "That's great!",
        "This is a good thing right?",
        "Sounds great!",
        "That's really good.",
        "I get what you're saying.",
        "I'm happy for you."
    ]
    
    let positiveRepliesEnd = [
        "I've seen it all so feel free to lay the hard stuff on me to.",
        "You can always tell me about the sad stuff too.",
        "Don't be afraid of telling me about your negative experiences/emotions as well.",
        "Is this a way to hide your deeper problems?",
        "I'd like to hear about how you really feel.",
        "Please expand on this.",
        "Tell me more about this.",
        "How has this affected you?",
        "Let's explore this.",
        "Please continue explore this situation."
    ]
    
    let negativeRepliesStart = [
        "Wow that's just terrible.",
        "That sucks.",
        "I feel you.",
        "I get what you're saying.",
        "I can relate.",
        "I understand what you're going through.",
        "I see.",
        "I understand.",
        "That's really tough.",
        "That must be hard to deal with."
    ]
    
    let negativeRepliesEnd = [
        "Please expand on this.",
        "Tell me more about this.",
        "How has this affected you?",
        "Is this is something you have healthy coping mechanisms for?",
        "Has this affected you at a deeper level?",
        "Please elaborate on what you've told me.",
        "Let's explore this.",
        "Please continue explore this situation.",
        "How does this make you feel.",
        "Do you think this is part of a wider problem?"
    ]
    
    if sentimentDouble == 0.0 {
        return "\(neutralRepliesStart.randomElement()!) \(neutralRepliesEnd.randomElement()!)"
    } else if sentimentDouble > 0.1 {
        return "\(positiveRepliesStart.randomElement()!) \(positiveRepliesEnd.randomElement()!)"
    } else {
        return"\(negativeRepliesStart.randomElement()!) \(negativeRepliesEnd.randomElement()!)"
    }
}
