//
//  AppsCompositionalView.swift
//  AppStoreClone
//
//  Created by Igor Tkach on 11.03.2020.
//  Copyright © 2020 Igor Tkach. All rights reserved.
//

import SwiftUI

class CompositionalController: UICollectionViewController {
  
  //MARK: - Properties
  
  let topCellId = "topCellId"
  let centerCellid = "centerCellId"

  
  
  //MARK: - VC LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .systemBackground
    navigationItem.title = "Apps"
    navigationController?.navigationBar.prefersLargeTitles = true
    collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: topCellId)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: centerCellid)
  }
  
  
  
  //MARK: - Class Init
  init() {
    
    let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
      
      switch sectionNumber {
      case 0:
        return CompositionalController.firstSection()
      case 1:
        return CompositionalController.secondSection()
        
      default: return NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))))
      }
      
      
    }
    
    
    
    
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  static func firstSection() -> NSCollectionLayoutSection {
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    item.contentInsets.bottom = 16
    item.contentInsets.trailing = 16
    
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
      .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300)), subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets.leading = 16
    return section
  }
  
  
  static func secondSection() -> NSCollectionLayoutSection {
    
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
    item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 16)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets.leading = 16
    return section
  }
  
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  
  //MARK: - UICollectionView methods
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch indexPath.section {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath)
      return cell
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: centerCellid, for: indexPath)
      cell.backgroundColor = .blue
      return cell
    }
    
    
  }
  
  
}






struct AppsView: UIViewControllerRepresentable {
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<AppsView>) -> UIViewController {
    let controller = CompositionalController()
    return UINavigationController(rootViewController: controller)
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AppsView>) {
    
  }
  
  
  
  typealias UIViewControllerType = UIViewController
  
  
  
  
  
  
}


struct AppsCompositionalView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
          .edgesIgnoringSafeArea(.all)
    }
}
