//
//  Common.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/29.
//

import Foundation

class Common {
    enum UserDefaultsKey: String {
        case isFirstEntryApp
        case isAutoLogin
    }
    
    /**
     # getUserDefaultsObject
     - parameters:
        - defaultsKey : 반환할 value의 UserDefaults Key - (E) Common.UserDefaultsKey
     - Authors: suni
     - Note: UserDefaults 값을 반환하는 공용 함수
     */
    static func getUserDefaultsObject(forKey defaultsKey: UserDefaultsKey) -> Any? {
        let defaults = UserDefaults.standard
        if let object = defaults.object(forKey: defaultsKey.rawValue) {
            return object
        } else {
            return nil
        }
    }
    
    /**
     # setUserDefaults
     - parameters:
        - value : 저장할 값
        - defaultsKey : 저장할 value의 UserDefaults Key - (E) Common.UserDefaultsKey
     - Authors: suni
     - Note: UserDefaults 값을 저장하는 공용 함수
     */
    static func setUserDefaults(_ value: Any?, forKey defaultsKey: UserDefaultsKey) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: defaultsKey.rawValue)
    }
}
