//
//  ChatTableViewCell.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit

final class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var chat: Chat? {
        didSet {
            set(chat: chat)
        }
    }
    
    private func set(chat: Chat?) {
        messageLabel.text = chat?.message
        timeLabel.text = chat?.postingDate.toStr(dateFormat: Constants.DateFormat.time)
    }
}
