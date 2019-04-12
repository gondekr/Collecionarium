//
//  ParseUser.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/21/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import Parse

@objc protocol UParseDelegate {
    optional func didSignUp(username: String)
    optional func didSignUpWithError(error: String)
}

class ParseUser {
    static let sharedInstance = ParseUser()
    
    var delegate: UParseDelegate?
    
    var user: PFUser? = PFUser.currentUser()
    
    func newUser(username: String, pass: String, email: String, photo: PFFile?){
        let user = PFUser()
        user.username = username
        user.password = pass
        user.email = email
        if photo != nil {
            user["image"] = photo
        }
        
        user.signUpInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if success {
                self.delegate?.didSignUp!(username)
            }
            if let error = error {
                let errorSTR = error.userInfo["error"] as? String
                print(errorSTR)
                self.delegate?.didSignUpWithError!(errorSTR!)
                print("Nem cadastrei nada cara!")
            }
        }
    }
    
    func login(username: String, pass: String) -> Bool{
        do {
            user = try PFUser.logInWithUsername(username, password: pass)
        } catch {
            print("NEM LOGUEI JÃO!")
        }
        return user != nil
    }
}


