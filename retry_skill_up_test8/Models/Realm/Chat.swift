//
//  Chat.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import Foundation
import RealmSwift

final class Chat: Object {
    
    dynamic var chatId = 0
    dynamic var message = ""
    dynamic var postingDate = Date()
    
    override static func primaryKey() -> String? {
        return "chatId"
        
    }
}
