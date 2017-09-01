//
//  HTTPClient.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit

final class HTTPClient: NSObject {
  func postRequest(url: String , params: [String: String], block: (_ res: Bool)-> ()) {
    // 发送请求
    let requestURL = URL(string: url)
    var request = URLRequest(url: requestURL!)
    request.httpMethod = "POST"
    // ...
//    if success {
        block(true) // 删除成功
//    } else {
//      block(false) // 删除失败
//    }
  }
}
