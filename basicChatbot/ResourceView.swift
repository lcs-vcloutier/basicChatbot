//
//  ResourceView.swift
//  basicChatbot
//
//  Created by Vincent Cloutier on 2022-01-04.
//

import SwiftUI

struct ResourceView: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        VStack(alignment: .leading) {
            Text("Truncate is not professional psychological help. \nBelow are resources that explain how the chatbot answers and how to get help.")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Divider()
            Text("If you need help right away: Call the National Suicide Prevention Lifeline at 1-800-273-8255.")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            ScrollView {
                Button {
                    openURL(URL(string: "https://www.who.int/news-room/fact-sheets/detail/depression")!)
                } label: {
                    CardView(image: "WHO", heading: "Depression", author: "World Health Organization")
                }
                Divider()
                Button {
                    openURL(URL(string: "https://www.psychiatry.org/patients-families/depression/what-is-depression")!)
                } label: {
                    CardView(image: "APA", heading: "What Is Depression?", author: "American Psychiatric Association")
                }
                Divider()
                Button {
                    openURL(URL(string: "https://www.healthline.com/health/depression/how-to-fight-depression")!)
                } label: {
                    CardView(image: "Healthline", heading: "How to Fight Depression", author: "Healthline")
                }
                Spacer()
            }
        }
        .navigationTitle("Resources")
        .padding()
    }
}


struct CardView: View {
    var image: String
    var heading: String
    var author: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Text(author.uppercased())
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        
    }
}

