//
//  ListGithubDetailsViewModelSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListGithubDetailsViewModelSpec: QuickSpec {
    override func spec() {
        describe( "ListGithubDetailsSpec")  {
            var viewModel: ListGithubDetailsViewModel!
            
            context("when starting viewModel with object filled") {
                
                beforeEach {
                    let model = DetailsGitHubModel(name: "Google",
                                                                image:  "https://avatars.githubusercontent.com/u/1342004?v=4",
                                                                description: "Descricão repositório: Google")
                    
                    viewModel = ListGithubDetailsViewModel(model: model)
                }
                
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                
                it("should contain the description filled in") {
                    expect(viewModel.name).toNot(beNil())
                }
                it("should contain the name filled in") {
                    expect(viewModel.name).toNot(beNil())
                }
                it("should contain the image filled in") {
                    expect(viewModel.setDescription()).toNot(beNil())
                }
            }
        }
    }
}
