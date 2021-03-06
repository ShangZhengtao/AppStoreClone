//
//  AppFullscreenHeaderCell.swift
//  AppStoreClone
//
//  Created by Igor Tkach on 4/23/19.
//  Copyright © 2019 Igor Tkach. All rights reserved.
//

import UIKit


class AppFullscreenHeaderCell: UITableViewCell {
  
  let todayCell = TodayCell()
  

  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    addSubview(todayCell)
    todayCell.fillSuperview()
    todayCell.imageContainerView.layer.cornerRadius = 0
    
//    addSubview(closeButton)
//    closeButton.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 38, height: 38))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
}

