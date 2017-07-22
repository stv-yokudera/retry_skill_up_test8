//
//  ChatTableViewProvider.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit
import STV_Extensions

final class ChatTableViewProvider: NSObject {
    
    var chatList: [Chat] = []
    var chatListBuilder: ChatListBuilder?
    
    func add(chatList: [Chat]){
        self.chatList = chatList
        chatListBuilder = ChatListBuilder(chatList: self.chatList)
    }
}

extension ChatTableViewProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chatListBuilder?.createSections().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return chatListBuilder?.createSections()[section]
            .toStr(dateFormat: Constants.DateFormat.dayAndYear)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList(at: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.className,
                                                 for: indexPath) as! ChatTableViewCell
        
        let chat = chatList(at: indexPath.section)[indexPath.row]
        cell.chat = chat
        
        return cell
    }
    
    private func chatList(at section: Int) -> [Chat] {
        return chatList.filter {
            $0.postingDate.toStr(dateFormat: Constants.DateFormat.dayAndYear) ==
                chatListBuilder?.createSections()[section].toStr(dateFormat: Constants.DateFormat.dayAndYear)
        }
    }
}
