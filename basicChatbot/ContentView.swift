//
//  ContentView.swift
//  basicChatbot
//
//  Created by Vincent Cloutier on 2021-12-31.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State private var messageText = ""
    @State var messages: [String] = ["Hi, I'm Truncate! Please skip any pleasantries and tell me what you're going through."]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        // check if message is from user or bot and display view accordingly
                        if message.contains("[USER]") {
                            let userMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            individualMessageView(msg: userMessage, isUserMessage: true)
                        } else {
                            individualMessageView(msg: message, isUserMessage: false)
                        }
                    }.rotationEffect(.degrees(180))
                }.rotationEffect(.degrees(180))
                
                HStack {
                    TextField("Message", text: $messageText)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(10)
                    
                    Button {
                        postMessage(msg: messageText)
                    } label: {
                        Image(systemName: "paperplane.fill")
                    }
                    .disabled(messageText.isEmpty)
                    .padding()
                    .font(.title)
                }
                .padding()
            }
            .onAppear(perform: {
                messages = defaults.stringArray(forKey: "messages")!
            })
            .navigationTitle("Truncate")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: ResourceView()) {
                        Text("Resources")
                    }
                }
            }
        }
    }
    func postMessage(msg: String) {
        withAnimation {
            messages.append("[USER]" + msg)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(getBotResponse(message: msg))
                    defaults.set(messages, forKey: "messages")
                }
            }
        }
    }
}
