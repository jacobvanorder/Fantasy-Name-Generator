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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func loadView(for viewController : UIViewController?) {
        _ = viewController?.view
    }
    
    func testOutletsAndActions() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController() as? ViewController
        self.loadView(for: viewController)
        XCTAssertNotNil(viewController?.button)
        XCTAssertNotNil(viewController?.nameLabel)
        XCTAssertEqual(viewController?.nameLabel?.text, "")

        if let actions = viewController?.button?.actions(forTarget: viewController,
                                                         forControlEvent: UIControlEvents.touchUpInside) {
            XCTAssertEqual(actions, ["buttonAction:"])
        }
    }
}
