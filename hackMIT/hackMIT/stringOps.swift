//
//  stringOps.swift
//  ExtractFrame
//
//  Created by Testing on 9/17/17.
//  Copyright © 2017 micpic. All rights reserved.
//

import Foundation


class stringOps {
    
//    let charset:Set = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "]
//    let charset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
//
    static func lowercase(myString:String) -> String{
        return myString.lowercased()
    }
    
    
    
    static func onlyLetters(myString:String) -> String{
        var myStringCopy = myString.replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
        myStringCopy = myStringCopy.replacingOccurrences(of: "\t", with: "", options: NSString.CompareOptions.literal, range: nil)
        myStringCopy = myStringCopy.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range: nil)
//        myStringCopy = myStringCopy.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.literal, range: nil)
        print(myStringCopy)
//        var newString = ""
        
//        myString.stringByRemovingRegexMatches(pattern: "\\+\\d{1,4} (0)?")
//        for (index, char) in myStringCopy.characters.enumerated(){
//            if charset.contains(char){
//                newString += (String)char
//            }
//        }
    
        
        return myStringCopy
    }
    
    
}
