//
//  ListRepositoryViewModelSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListRepositoryViewModelSpec: QuickSpec {
    
    var viewModel: ListRepositoryApiMock!
    
    override func spec() {
        describe( "ListRepositoryViewModel")  {
            var viewModel: ListRepositoryViewModel!
            
            context("when method request succeeds") {
                beforeEach {
                    viewModel = ListRepositoryViewModel(api: ListRepositoryApiMock(shouldReturn: true))
                }
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                it("should contain 30 element in array") {
                    viewModel.fetchDetails { success in
                        let numbersRepository = 30
                        expect(viewModel.dataList?.count).to(equal(numbersRepository))
                    }
                }
                it("should contain an object other than nil") {
                    viewModel.fetchDetails { success in
                        expect(viewModel.dataList).toNot(beNil())
                    }
                }
            }
            context("when method request is fail") {
                beforeEach {
                    viewModel = ListRepositoryViewModel(api: ListRepositoryApiMock(shouldReturn: false))
                }
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                it("when method request is failed") {
                    viewModel.fetchDetails { success in
                        expect(viewModel.dataList).to(beNil())
                    }
                }
            }
        }
    }
    
}
