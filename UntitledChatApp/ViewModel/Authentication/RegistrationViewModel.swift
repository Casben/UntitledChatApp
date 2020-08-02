//
//  RegistrationViewModel.swift
//  UntitledChatApp
//
//  Created by Herbie on 3/28/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import Foundation
struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false
    }
}
