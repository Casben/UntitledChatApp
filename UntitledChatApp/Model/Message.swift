//
//  Message.swift
//  UntitledChatApp
//
//  Created by Herbie on 4/2/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import Foundation
import Firebase

struct Message {
    let text: String
    var toId: String
    var fromId: String
    var timeStamp: Timestamp!
    var user: User?
    
    let isFromCurrentUser: Bool
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.timeStamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
    }
}


struct Conversation {
    var user: User
    var message: Message
    
    
}
