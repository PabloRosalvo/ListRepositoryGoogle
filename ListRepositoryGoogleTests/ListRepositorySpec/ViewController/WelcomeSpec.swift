//
//  WelcomeSpe.swift
//  ListRepositoryGoogleTests
//
//  Created by Pablo Rosalvo on 28/01/22.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import ListRepositoryGoogle

final class WelcomeSpec: QuickSpec {
    override func spec() {
        describe("WelcomeSpec")  {
            var sut: WelcomeViewController!
            
            context("when init viewController") {
                beforeEach {
                    sut = WelcomeViewController()
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
