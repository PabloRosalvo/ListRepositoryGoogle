//
//  ListRepositoryGoogleSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListRepositoryGoogleSpec: QuickSpec {
    override func spec() {
        describe( "ListRepositoryGoogleViewController")  {
            var sut: ListRepositoryGoogleViewController!
            var viewModel: ListRepositoryViewModel!
            
            context("when init viewController") {
                beforeEach {
                    let coordinator = GoogleReposytoryCoordinator(navigation: UINavigationController())
                    viewModel = ListRepositoryViewModel(api: ListRepositoryApiMock(shouldReturn: true))
                    sut = ListRepositoryGoogleViewController(viewModel: viewModel, coordinator: coordinator)
                    WindowHelper.showInTestWindow(viewController: sut)
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
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
