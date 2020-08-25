//
//  SamsNewTakeHomeTests.swift
//  SamsNewTakeHomeTests
//
//  Created by Franklin Mott on 8/11/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import SamsNewTakeHome

class SamsNewTakeHomeTests: XCTestCase {
    
    func testSetupSearch() {
        let vc = ViewController()
        vc.setupSearchBar()
        XCTAssertEqual(vc.searchController.searchBar.placeholder, "Search articles")
        XCTAssertNotNil(vc.navigationItem.searchController)
    }
    func testSetupTable() {
        let vc = ViewController()
        let test = vc.setupTableView()
        XCTAssertTrue(test)
    }
    func testSetupView() {
        let ac = ArticleCell()
        let test = ac.setupView()
        XCTAssertTrue(test)
    }

}
