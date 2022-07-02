//
//  NewsView.swift
//  SpaceNews
//
//  Created by Danil Peregorodiev on 02.07.2022.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var data: SpaceAPI
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                NewsArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)
                    .onTapGesture {
                        openURL(URL(string: news.url)!)
                    }
            }
        }
        .refreshable {
            data.getData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(SpaceAPI())
    }
}
