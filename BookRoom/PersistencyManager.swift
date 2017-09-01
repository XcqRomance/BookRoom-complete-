//
//  PersistencyManager.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//  数据持久化的类

import UIKit

let LibraryCacheDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!

final class PersistencyManager: NSObject {
  
  var books = [Book]()
  
  override init() {
    super.init()
    
    let fileName = "\(LibraryCacheDirectory)/albums.bin"
    let fileurl = URL(fileURLWithPath: fileName)
    let bookdata = try? Data(contentsOf: fileurl)
    
    guard let data = bookdata else { // 本地沙河没有数据，所以需要加在bundle中的数据
      setupBundleData()
      return
    }
    let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
    for b in json! {
      let book = Book(fromDictionary: b as! [String : Any])
      books.append(book)
    }
  }

  private func setupBundleData() {
    let path = Bundle.main.path(forResource: "books", ofType: "json")
    let url = URL(fileURLWithPath: path!)
    
    do {
      let data = try Data(contentsOf: url)
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
      print(data)
      //      print(json)
      for b in json! {
        //        print(b)
        let book = Book(fromDictionary: b as! [String : Any])
        books.append(book)
      }
      print(books)
      saveBooks()
    } catch {
      print(error)
    }

  }
  
  func getBooks() -> [Book]{
    return books
  }
  
  func saveBooks() {
    let fileName = "\(LibraryCacheDirectory)/albums.bin"
    let url = URL(fileURLWithPath: fileName)
    let bookDicts = books.map { (book) -> [String:Any] in
      book.toDictionary()
    }
    let data = try? JSONSerialization.data(withJSONObject: bookDicts, options: .prettyPrinted)
    try? data?.write(to: url)
  }
  
  func deleteBookAt(index: Int) {
    if index >= books.count {
      print("数组越界，没有此绘本书")
      return
    }
    books.remove(at: index)
  }
}
