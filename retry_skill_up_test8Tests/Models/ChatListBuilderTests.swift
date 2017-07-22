//
//  ChatListBuilderTests.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
import STV_Extensions
@testable import retry_skill_up_test8

final class ChatListBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateSections() {
        // Setup
        let testChatList = setupChatsData()
        let chatListBuilder = ChatListBuilder(chatList: testChatList)
        
        // Exercise
        let sections = chatListBuilder.createSections()
        
        // Verify
        XCTAssertEqual(sections.count, 3)
        XCTAssertEqual(sections[0].toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2015/01/01 01:23:45")
        XCTAssertEqual(sections[1].toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/22 01:23:45")
        XCTAssertEqual(sections[2].toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/23 01:23:45")
    }
    
    // MARK: - private
    
    private func setupChatsData() -> [Chat] {
        let chat1 = Chat()
        chat1.chatId = 1
        chat1.postingDate = "2015/01/01 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat1.message = "2015/01/01_メッセージ1"
        
        let chat2 = Chat()
        chat2.chatId = 2
        chat2.postingDate = "2017/07/22 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat2.message = "2017/07/22_メッセージ1"
        
        let chat3 = Chat()
        chat3.chatId = 3
        chat3.postingDate = "2017/07/23 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat3.message = "2017/07/23_メッセージ1"
        
        let chat4 = Chat()
        chat4.chatId = 4
        chat4.postingDate = "2017/07/23 13:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat4.message = "2017/07/23_メッセージ2"
        
        return [chat1, chat2, chat3, chat4]
    }
}
