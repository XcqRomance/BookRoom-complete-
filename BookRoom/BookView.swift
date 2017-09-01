//
//  BookView.swift
//  BookRoom
//
//  Created by romance on 2017/5/4.
//  Copyright © 2017年 romance. All rights reserved.
//

import UIKit

final class BookView: UICollectionView {
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    
    let nib = UINib(nibName: "BookCell", bundle: nil)
    register(nib, forCellWithReuseIdentifier: "BookCell")
    backgroundColor = UIColor.hexColor(0x176DA6)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  
}
