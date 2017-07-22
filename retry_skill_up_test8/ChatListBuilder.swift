//
//  ChatListBuilder.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import Foundation
import STV_Extensions

final class ChatListBuilder {
    
    var chatList = [Chat]()
    var dateList = [Date]()
    
    init(chatList: [Chat]) {
        self.chatList = chatList
        dateList = createSections()
    }
    
    func createSections() -> [Date] {
        var sectionDateList = [Date]()
        
        for chat in chatList {
            
            let dateString = chat.postingDate.toStr(dateFormat: Constants.DateFormat.dayAndYear)
            let sameDateList = sectionDateList.filter {
                $0.toStr(dateFormat: Constants.DateFormat.dayAndYear) == dateString
            }
            if sameDateList.isEmpty {
                sectionDateList.append(chat.postingDate)
            }
        }
        return sectionDateList
    }
}
