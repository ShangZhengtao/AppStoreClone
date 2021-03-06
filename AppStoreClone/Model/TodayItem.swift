//
//  TodayItem.swift
//  AppStoreClone
//
//  Created by Igor Tkach on 4/23/19.
//  Copyright © 2019 Igor Tkach. All rights reserved.
//

import UIKit




struct TodayItem {
  
  let releaseDate: String
  let title: String
  let image: UIImage
  
  let cellType: CellType
  
  let apps: [FeedResult]

  enum CellType: String {
    case single, multiple
  }
  
}
