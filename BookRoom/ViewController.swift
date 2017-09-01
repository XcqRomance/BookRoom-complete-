//
//  ViewController.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var books = [Book]()
  var bookView: BookView?
		
  // MARK: - life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    books = BookAPI.sharedInstance.getBooks()
    

    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.width / 3 , height: 130)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let bookView = BookView(frame: view.bounds, collectionViewLayout: layout)
    bookView.dataSource = self
    bookView.delegate = self
    view.addSubview(bookView)
    self.bookView = bookView
  }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return books.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
    if indexPath.item > books.count - 1  {
      cell.coverName.isHidden = true
      cell.bookCover.isHidden = true
      cell.isReadImageView.isHidden = true
    } else {
      cell.coverName.isHidden = false
      cell.bookCover.isHidden = false
      cell.isReadImageView.isHidden = false
      cell.book = books[indexPath.item]
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let alertVc = UIAlertController(title: "要删除这本绘本么", message: "", preferredStyle: .alert)
    let sureAction = UIAlertAction(title: "确定删除", style: .default, handler: { (_) in
      BookAPI.sharedInstance.deleteBookAt(index: indexPath.item) // 发送删除绘本的请求
      self.books = BookAPI.sharedInstance.getBooks() // 更新数据源
      self.bookView?.deleteItems(at: [indexPath]) 
      BookAPI.sharedInstance.saveBooks() // 保存最新数据，到本地，下次加载app，删除绘本不再显示
    })
    alertVc.addAction(sureAction)
    let cancelAction = UIAlertAction(title: "取消", style: .default, handler: nil)
    alertVc.addAction(cancelAction)
    present(alertVc, animated: true, completion: nil)
  }

}

