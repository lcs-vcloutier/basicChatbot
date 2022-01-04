//
//  ResourceView.swift
//  basicChatbot
//
//  Created by Vincent Cloutier on 2022-01-04.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("This app is not professional psychological help. \nBelow are resources that explain how the chatbots answers. \nThere are also links to professional resources.")
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
                    // Open Link
                } label: {
                    CardView(image: "Image", heading: "Depression", author: "World Health Organization")
                }
                Button {
                    // Open Link
                } label: {
                    CardView(image: "Image", heading: "What Is Depression?", author: "American Psychiatric Association")
                }
                Button {
                    // Open Link
                } label: {
                    CardView(image: "Image", heading: "How to Fight Depression", author: "Healthline")
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
                        .lineLimit(3)
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

