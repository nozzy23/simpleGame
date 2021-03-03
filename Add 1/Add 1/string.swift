//
//  string.swift
//  Add 1
//
//  Created by oscar nunez on 3/3/21.
//

import Foundation

extension String
{
    //accepts a Int and produce a string
    // static add the function to class string rather than a instance
    static func randomNumber(length: Int) -> String{
        var result = ""
        
        for _ in 0..<length {
            let digit = Int.random(in:0...9)
            result += "\(digit)"
        }
        return result
    }
}
