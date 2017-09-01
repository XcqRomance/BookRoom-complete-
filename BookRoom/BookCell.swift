//
//  BookCell.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit
import SDWebImage

final class BookCell: UICollectionViewCell {
  
  @IBOutlet weak var bookCover: UIImageView!
  @IBOutlet weak var coverName: UILabel!
  @IBOutlet weak var isReadImageView: UIImageView!
  @IBOutlet weak var bookWidth: NSLayoutConstraint!
  @IBOutlet weak var bookHeight: NSLayoutConstraint!
  @IBOutlet weak var gradientView: UIView!
  
  var book: Book? {
    didSet {
      
      bookCover.sd_setImage(with: URL(string: (book?.pic.aliyunThumb())!), placeholderImage: UIImage(named: "bookDefault"), options: .retryFailed) { (_, _, _, _) in
        self.coverName.isHidden = true
      }
      
      coverName.text = book?.bookName
//      title.text = book?.bookName
      if (book?.isRead)! { // 是否阅读过该书籍
        isReadImageView.isHidden = false
      } else {
        isReadImageView.isHidden = true
      }
      if book?.orientation == 1 { // 竖版书籍
        bookWidth.constant = 67
        bookHeight.constant = 88
      } else {
        bookWidth.constant = 96
        bookHeight.constant = 67
      }
      layoutIfNeeded()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

    bookCover.layer.cornerRadius = 10
    
    let gradLayer = CAGradientLayer()
    gradLayer.colors = [UIColor.hexColor(0x045b94).cgColor, UIColor.hexColor(0x176da6).cgColor]
    gradLayer.startPoint = CGPoint(x: 0, y: 0)
    gradLayer.endPoint = CGPoint(x: 0, y: 1)
    gradLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3, height: 25)
    gradientView.layer.addSublayer(gradLayer)
  }
  
}
