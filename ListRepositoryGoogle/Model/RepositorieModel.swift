//
//  RepositorieModel.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 24/01/22.
//

import Foundation

// MARK: - WelcomeElement
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct ListRepository: Codable {
    let listRepositories: [RepositorieModel]?
}

struct RepositorieModel: Codable {
    let name: String?
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case owner = "owner"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let nodeID: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
    }
}
   
