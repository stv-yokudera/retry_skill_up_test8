//
//  ChatTableViewCellTests.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
import STV_Extensions
@testable import retry_skill_up_test8

final class ChatTableViewCellTests: XCTestCase {
    
    let dataSource = FakeDataSource()
    var tableView: UITableView!
    var cell: ChatTableViewCell!
    
    override func setUp() {
        super.setUp()
        
        guard let chatVC =
            UIStoryboard.viewController(storyboardName: ChatViewController.className,
                                        identifier: ChatViewController.className) as? ChatViewController else {
                                            XCTFail("ChatViewController is nil.")
                                            return
        }
        
        _ = chatVC.view
        tableView = chatVC.tableView
        tableView?.dataSource = dataSource
        
        cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.className,
                                             for: IndexPath(row: 0, section: 0)) as! ChatTableViewCell
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension ChatTableViewCellTests {
    
    final class FakeDataSource: NSObject, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
