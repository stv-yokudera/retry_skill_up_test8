//
//  ChatTests.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
import STV_Extensions
@testable import retry_skill_up_test8

final class ChatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testChatDefaultValue() {
        // Verify
        XCTAssertEqual(Chat().chatId, 0)
        XCTAssertEqual(Chat().message, "")
        XCTAssertEqual(Chat().postingDate.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"),
                       Date().toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"))
    }
    
    /// PrimaryKeyが正しいかテスト
    func testPrimaryKey() {
        // Verify
        XCTAssertEqual(Chat.primaryKey(), "chatId")
    }
}
