//
//  NewsArticle.swift
//  SpaceNews
//
//  Created by Danil Peregorodiev on 02.07.2022.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String

    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else {
                        HStack {
                            //
                        }
                    }
                }
            }
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(5)
                .font(.body)
                .padding(8)
        }
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "SouthRussian", imageUrl: "...\\", siteName: "SouthRussian GitHub", summary: "Check out for new Swift project")
    }
}
