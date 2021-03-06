//
//  BernardTests.swift
//  BernardTests
//
//  Created by Michael Johnson on 12/5/16.
//  Copyright © 2016 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Bernard

class ViewControllerTests: XCTestCase {
    
    var viewController : ViewController?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as? ViewController
        XCTAssertNotNil(viewController)

    }

    func loadView() {
        _ = viewController?.view
    }
    
    func testOutletsAndActions() {
        loadView()
        XCTAssertNotNil(viewController?.button)
        XCTAssertNotNil(viewController?.nameLabel)
        XCTAssertEqual(viewController?.nameLabel?.text, "")

        if let actions = viewController?.button?.actions(forTarget: viewController,
                                                         forControlEvent: UIControlEvents.touchUpInside) {
            XCTAssertEqual(actions, ["buttonAction:"])
        }
    }
    
    func testViewDidLoadInitializesDelegate() {
        loadView()
        
        XCTAssertNotNil(viewController?.delegate)
    }
    
    func testButtonAction() {
        class FakeDelegate:ViewControllerDelegateProtocol {
            var buttonActionWasCalled = false
            
            func buttonAction() {
                buttonActionWasCalled = true
            }
        }

        let fakeDelegate = FakeDelegate.init()
        viewController?.delegate = fakeDelegate
        loadView()
        if let button = viewController?.button {
            viewController?.buttonAction(button)
        }
        XCTAssertTrue(fakeDelegate.buttonActionWasCalled);
    }
    
    func testNameText() {
        XCTAssertEqual(viewController?.nameText,nil)
        loadView()
        XCTAssertEqual(viewController?.nameText,"")
        let testText = "Foobar"
        viewController?.nameText = testText
        XCTAssertEqual(viewController?.nameText, testText)
        XCTAssertEqual(viewController?.nameLabel.text, testText)
    }
}
