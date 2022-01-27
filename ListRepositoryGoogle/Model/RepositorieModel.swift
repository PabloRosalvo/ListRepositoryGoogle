//
//  RepositorieModel.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 24/01/22.
//

import Foundation

struct RepositorieModel: Codable {
    var name: String?
    let openIssuesCount: Int?
    let owner: Owner?
    let defaultBranch: String
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case defaultBranch = "default_branch"
        case name = "name"
        case owner = "owner"
        case openIssuesCount = "open_issues_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.owner = try container.decode(Owner.self, forKey: .owner)
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.openIssuesCount = (try? container.decode(Int.self, forKey: .openIssuesCount)) ?? 0
        self.defaultBranch = (try? container.decode(String.self, forKey: .defaultBranch)) ?? ""
     }
}

// MARK: - Owner
struct Owner: Codable {
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
   
