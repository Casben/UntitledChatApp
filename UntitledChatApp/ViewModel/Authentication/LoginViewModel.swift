//
//  LoginViewModel.swift
//  UntitledChatApp
//
//  Created by Herbie on 3/28/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
