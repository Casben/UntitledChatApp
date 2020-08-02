//
//  ConversationViewModel.swift
//  UntitledChatApp
//
//  Created by Herbie on 4/3/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import Foundation

struct ConversationViewModel {
    private let conversation: Conversation
    
    var profileImageUrl: URL? {
        return URL(string: conversation.user.profileImageUrl)
    }
    
    var timestamp: String {
        let date = conversation.message.timeStamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
