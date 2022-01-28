//
//  ListDetailsSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 28/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListDetailsSpec: QuickSpec {
    override func spec() {
        describe("ListDetailsSpec")  {
            var sut: ListDetailsRepositoryViewController!
            
            context("when init viewController") {
                
                beforeEach {
                    let model = DetailsGitHubModel(name: "Google",
                                                   image:  "https://avatars.githubusercontent.com/u/1342004?v=4",
                                                   description: "Descricão repositório: Google")
                    let viewModel = ListGithubDetailsViewModel(model: model)
                    sut = ListDetailsRepositoryViewController(viewModel: viewModel)
                    WindowHelper.showInTestWindow(viewController: sut)
                }
                
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                
                it("should contain a valid layout") {
                    expect(sut).toEventually(haveValidSnapshot())
                }
            }
        }
    }
}
