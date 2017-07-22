//
//  ChatDaoTests.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import XCTest
import STV_Extensions
@testable import retry_skill_up_test8

final class ChatDaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ChatDao.deleteAll()
    }
    
    override func tearDown() {
        ChatDao.deleteAll()
        super.tearDown()
    }
    
    /// チャットデータを追加するテスト
    func testAdd() {
        
        // Setup
        let chat1 = Chat()
        chat1.chatId = 1
        chat1.postingDate = "2017/07/22 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat1.message = "メッセージ1"
        
        // Exercise
        ChatDao.add(model: chat1)
        
        // Verify
        let allTask = ChatDao.findAll()
        
        XCTAssertEqual(allTask.count, 1)
        
        XCTAssertEqual(allTask[0].chatId, 1)
        XCTAssertEqual(allTask[0].postingDate.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/22 01:23:45")
        XCTAssertEqual(allTask[0].message, "メッセージ1")
    }
    
    /// postingDateの新しい順で全件取得するテスト
    func testFindAll() {
        
        // Setup
        setupChatsData()
        
        // Exercise
        let allTask = ChatDao.findAll()
        
        // Verify
        XCTAssertEqual(allTask.count, 2)
        
        XCTAssertEqual(allTask[0].chatId, 1)
        XCTAssertEqual(allTask[0].postingDate.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/22 01:23:45")
        XCTAssertEqual(allTask[0].message, "メッセージ1")
        XCTAssertEqual(allTask[1].chatId, 2)
        XCTAssertEqual(allTask[1].postingDate.toStr(dateFormat: "yyyy/MM/dd HH:mm:ss"), "2017/07/23 01:23:45")
        XCTAssertEqual(allTask[1].message, "メッセージ2")
    }
    
    // MARK: - private
    
    private func setupChatsData() {
        let chat1 = Chat()
        chat1.chatId = 1
        chat1.postingDate = "2017/07/22 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat1.message = "メッセージ1"
        ChatDao.add(model: chat1)
        
        let chat2 = Chat()
        chat2.chatId = 2
        chat2.postingDate = "2017/07/23 01:23:45".toDate(dateFormat: "yyyy/MM/dd HH:mm:ss")
        chat2.message = "メッセージ2"
        ChatDao.add(model: chat2)
    }
    
}
