//
//  ViewControllerDelegateTests.swift
//  Bernard
//
//  Created by Michael Johnson on 12/6/16.
//  Copyright © 2016 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Bernard

class ViewControllerDelegateTests: XCTestCase {
    
    class FakeViewController : ViewControllerProtocol {
        var nameText : String? = nil
        var favoriteToggleIsOn: Bool = false
    }
    var fakeViewController = FakeViewController.init()
    var SUT : Controller!

    class FakeNameGenerator : NameGenerating {
        var count = 0
        func createName() -> String {
            var name : String
            switch count {
            case 0:
                name = "Blammo"
            case 1:
                name = "Kablooie"
            default:
                name = "Spam"
            }
            count += 1
            return name
        }
    }

    override func setUp() {
        super.setUp()
        SUT = Controller.init(viewController:fakeViewController, nameGenerator: FakeNameGenerator())
    }
    
    func testNextNameButtonAction() {
        SUT.nextNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, "Blammo")
        SUT.nextNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, "Kablooie")
        SUT.nextNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, "Spam")
    }

    func testThatFavoritesAreRemembered() {
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        SUT.nextNameButtonAction()

        // First name
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        fakeViewController.favoriteToggleIsOn = true
        SUT.favoriteToggleWasUpdatedAction()
        SUT.nextNameButtonAction()
        
        // Second name
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        SUT.nextNameButtonAction()
        
        // Third name
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        fakeViewController.favoriteToggleIsOn = true
        SUT.favoriteToggleWasUpdatedAction()
        SUT.previousNameButtonAction()
        
        // Second name
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        SUT.previousNameButtonAction()
        
        // First name
        XCTAssertTrue(fakeViewController.favoriteToggleIsOn)
        SUT.nextNameButtonAction()
        
        // Second name
        XCTAssertFalse(fakeViewController.favoriteToggleIsOn)
        SUT.nextNameButtonAction()

        // Third name
        XCTAssertTrue(fakeViewController.favoriteToggleIsOn)
    }

    func testPreviousNameButtonAction() {
        SUT.previousNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, nil)
        SUT.nextNameButtonAction()
        SUT.nextNameButtonAction()
        SUT.nextNameButtonAction()
        SUT.previousNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, "Kablooie")
        SUT.previousNameButtonAction()
        XCTAssertEqual(fakeViewController.nameText, "Blammo")
    }

}
