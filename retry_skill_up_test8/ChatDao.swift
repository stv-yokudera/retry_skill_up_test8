//
//  ChatDao.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import Foundation
import RealmSwift

final class ChatDao {
    
    static let daoHelper = RealmDaoHelper<Chat>()
    
    // MARK: - add
    
    /// 新規追加
    static func add(model: Chat) {
        
        let newObject = Chat()
        newObject.chatId = daoHelper.newId()!
        newObject.message = model.message
        newObject.postingDate = model.postingDate
        
        daoHelper.add(d: newObject)
    }
    
    // MARK: - find
    
    /// postingDateの新しい順で全件取得
    static func findAll() -> [Chat] {
        let objects =  daoHelper.findAll().sorted(byKeyPath: "postingDate", ascending: true)
        return objects.map { Chat(value: $0) }
    }
    
    // MARK: - delete
    
    /// レコードを全件削除する
    static func deleteAll() {
        daoHelper.deleteAll()
    }
}
