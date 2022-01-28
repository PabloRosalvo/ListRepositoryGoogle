//
//  ListRepositoryApiSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ListRepositoryApiSpec: QuickSpec {
    
    var listRepositoryApiMock: ListRepositoryApiMock!
    
    override func spec() {
        describe( "ListRepositoryApi")  {
            context("when init api") {
                context("when the request is successful") {
                    beforeEach {
                        self.listRepositoryApiMock = ListRepositoryApiMock(shouldReturn: true)
                    }
                    
                    it("should return true equals success to request") {
                        self.fetchList { [weak self] _ , _  in
                            expect(self?.listRepositoryApiMock.shouldReturn).to(equal(true))
                        }
                    }
                }
                
                context("when the request gives an error") {
                    beforeEach {
                        self.listRepositoryApiMock = ListRepositoryApiMock(shouldReturn: false)
                    }
                    
                    it("should return false equal to error to request") {
                        self.fetchList { [weak self] _ , _  in
                            expect(self?.listRepositoryApiMock.shouldReturn).to(equal(false))
                        }
                    }
                }
            }
        }
    }
}


extension ListRepositoryApiSpec {
    func fetchList(completion: @escaping ([RepositorieModel]?, RequestError?) -> Void) {
        listRepositoryApiMock.fetch { model, error  in
            guard error == nil else {
                completion(model, error)
                return
            }
            completion(nil, error)
        }
    }
}

