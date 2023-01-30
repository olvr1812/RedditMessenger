//
//  StorageManager.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 30.01.2023.
//

import Foundation

class UserDefaultsStorage {
    static let shared = UserDefaultsStorage()
    
    private let userDefaults =  UserDefaults.standard
    private let key = "access_token"
    
    var accessToken: String? {
        get {
            return userDefaults.string(forKey: key)
        } set {
            if let token = newValue {
                userDefaults.set(token, forKey: key)
            }
        }
    }
}
