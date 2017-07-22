//
//  ChatViewController.swift
//  retry_skill_up_test8
//
//  Created by OkuderaYuki on 2017/07/22.
//  Copyright © 2017年 Okudera Yuki. All rights reserved.
//

import UIKit

/// チャット画面
final class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    let dataSource = ChatTableViewProvider()
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
    
    deinit {
        // 登録した通知を削除する
        self.removeNotificationsObserver()
    }
    
    // MARK: - register observers
    
    /// 通知を登録する
    func registerObservers() {
        self.addNotificationObserver(name: .UIKeyboardWillShow, selector: .keyboardWillShow)
        self.addNotificationObserver(name: .UIKeyboardWillHide, selector: .keyboardWillHide)
    }
    
    // MARK: - keyboard
    
    /// キーボードを開く直前の処理
    func keyboardWillShow(notification: Notification?) {
        guard let rect = (notification?
            .userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
        let duration = notification?
            .userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        UIView.animate(withDuration: duration, animations: { _ in
            self.view.transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
        })
    }
    
    /// キーボードを閉じる直前の処理
    func keyboardWillHide(notification: Notification?) {
        guard let duration = notification?
            .userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        UIView.animate(withDuration: duration, animations: { _ in
            self.view.transform = CGAffineTransform.identity
        })
    }
}

// MARK: - fileprivate
private extension ChatViewController {
    
    /// 初期設定をする
    func setup() {
        textView.delegate = self
        sendButton.isEnabled = false
        setupTableView()
        registerObservers()
    }
    
    /// TableViewの初期設定をする
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 88
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        reload()
    }
    
    /// 再読み込みする
    func reload() {
        dataSource.add(chatList: ChatDao.findAll())
        tableView.reloadData()
    }
    
    /// textViewを空にして、キーボードを閉じる
    func clearInputText() {
        sendButton.isEnabled = false
        textView.text = ""
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
    
    // MARK: - action
    
    /// 送信ボタン押下時の処理
    @IBAction func didTapSend(_ sender: UIButton) {
        
        let chat = Chat()
        chat.message = textView.text
        chat.postingDate = Date()
        ChatDao.add(model: chat)
        reload()
        
        clearInputText()
    }
}

// MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
}

// MARK: - UITextViewDelegate
extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        sendButton.isEnabled = !textView.text.isEmpty
    }
}

// MARK: - Custom Selectors
private extension Selector {
    static let keyboardWillShow = #selector(ChatViewController.keyboardWillShow(notification:))
    static let keyboardWillHide = #selector(ChatViewController.keyboardWillHide(notification:))
}
