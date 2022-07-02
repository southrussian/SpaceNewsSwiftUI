//
//  APIClient.swift
//  SpaceNews
//
//  Created by Danil Peregorodiev on 29.06.2022.
//

// https://api.spaceflightnewsapi.net/v3/articles

import Foundation

struct SpaceData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var summary: String
    var publishedAt: String
    var newsSite: String
}

@MainActor class SpaceAPI : ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", summary: "Try to refresh when your Interner connection will be available", publishedAt: "Error", newsSite: "Error")]
                }
                return
            }

        }
    }
}
