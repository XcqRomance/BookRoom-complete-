//
//  BookAPI.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit

final class BookAPI: NSObject {
  
  private var persistencyManager: PersistencyManager
  private var httpClient: HTTPClient
  
  /// 单例
  static let sharedInstance = BookAPI()
  
  override init() { // 线程安全
    persistencyManager = PersistencyManager()
    httpClient = HTTPClient()
    super.init()
  }
  
  /// 返回书籍数量
  ///
  /// - Returns: book数组
  func getBooks() -> [Book] {
    return persistencyManager.getBooks()
  }
  
  /// 保存书籍数据
  func saveBooks() {
    persistencyManager.saveBooks()
  }
  
  
  /// 删除指定位置的绘本
  ///
  /// - Parameter index: index 0
  func deleteBookAt(index: Int) {
    httpClient.postRequest(url: "delete/book", params: ["book_id": ""]) { (res) in
      if res { // 服务器删除成功,删除本地的绘本
        persistencyManager.deleteBookAt(index: index)
      } else {
        print("删除绘本失败，请稍后再试")
      }
    }
  }
  
}
