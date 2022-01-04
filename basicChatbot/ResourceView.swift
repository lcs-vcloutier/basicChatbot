//
//  ResourceView.swift
//  basicChatbot
//
//  Created by Vincent Cloutier on 2022-01-04.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        ScrollView {
            Text("This app is not a replacement for professional psychological help. Below are links that help explain how we developed the chatbot's answers. There are also links to professional resources.")
                .font(.title)
            Button {
                // Open Link
            } label: {
                CardView(image: "Image", category: "test", heading: "test", author: "test")
            }
            Button {
                // Open Link
            } label: {
                CardView(image: "Image", category: "test", heading: "test", author: "test")
            }
            Button {
                // Open Link
            } label: {
                CardView(image: "Image", category: "test", heading: "test", author: "test")
            }

            Spacer()
        }
        .navigationTitle("Resources")
        .padding()
    }
}


struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)

                Spacer()
            }
            .padding()
        }
        
    }
}

