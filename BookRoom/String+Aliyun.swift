//
//  String+Aliyun.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit

// 判断型号
let isPad = ( UI_USER_INTERFACE_IDIOM() == .pad)
let fileHost = "https://xxxxxxxxx.cn"

extension String {
  func aliyunThumb() -> String {
    if isPad {
      return "\(fileHost)\(self)" + "!iPadThumb"
    } else {
      return "\(fileHost)\(self)" + "!thumb"
    }
  }
}

extension UIColor {
  /**
   *  通过16进制数，返回颜色
   */
  class func hexColor(_ hex: UInt32) -> UIColor {
    let r = (hex >> 16) & 0xFF
    let g = (hex >> 8) & 0xFF;
    let b = (hex) & 0xFF;
    
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
  }
}
