//
//  ListGithubDetailsViewModel.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Foundation

typealias DetailsGitHubModel = (name: String, image: String, description: String)


protocol ListGithubDetailsViewModelProtocol {
    var name: String { get }
    var image: String { get }
    func setDescription() -> String
}

final class ListGithubDetailsViewModel: ListGithubDetailsViewModelProtocol {
    
    private let model: DetailsGitHubModel
    
    var name: String {
        return "Nome do Repositório: \(model.name)"
    }
    var image: String {
        return model.image
    }
    
    func setDescription() -> String {
        if model.description.isEmpty {
            return "Repositório não tem descrição"
        }
        return "Descrição do repositório:  \(model.description)"
    }
    
    init(model: DetailsGitHubModel) {
        self.model = model
    }
}
