//
//  ErrorViewSpec.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class ErrorViewSpec: QuickSpec {
    override func spec() {
        describe( "ErrorView")  {
            var sut: ErrorViewGeneric!
            
            context("when init viewController") {
                
                beforeEach {
                    sut = ErrorViewGeneric()
                    sut.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 600))
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
