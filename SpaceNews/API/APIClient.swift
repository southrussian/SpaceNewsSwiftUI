//
//  APIClient.swift
//  SpaceNews
//
//  Created by Danil Peregorodiev on 29.06.2022.
//

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
