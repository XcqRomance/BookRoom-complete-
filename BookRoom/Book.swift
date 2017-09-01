//
//  Book.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import Foundation

struct Book {
  
  var bid: Int!
  var bookName: String!
  var isRead: Bool!
  var orientation: Int!
  var pic: String!
  
  
  /**
   * Instantiate the instance using the passed dictionary values to set the properties values
   */
  init(fromDictionary dictionary: [String: Any]){
    bid = dictionary["bid"] as? Int
    bookName = dictionary["book_name"] as? String
    isRead = dictionary["is_read"] as? Bool
    orientation = dictionary["orientation"] as? Int
    pic = dictionary["pic"] as? String
  }
  
  /**
   * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
   */
  func toDictionary() -> [String:Any]
  {
    var dictionary = [String: Any]()
    if bid != nil{
      dictionary["bid"] = bid
    }
    if bookName != nil{
      dictionary["book_name"] = bookName
    }
    if isRead != nil{
      dictionary["is_read"] = isRead
    }
    if orientation != nil{
      dictionary["orientation"] = orientation
    }
    if pic != nil{
      dictionary["pic"] = pic
    }
    return dictionary
  }
		
}
