//
//  TableViewCellWithColView.swift
//  compositeLayout
//
//  Created by Venkata harsha Balla on 8/6/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import UIKit

class TableViewCellWithColView: UITableViewCell {
    
    // delegate to get the data for the clicked tab
    
    public weak var delegate: CollectionTableViewCellDelegate?

   // creating a collectionview
    
    static let identifier = "tableViewCol"
    
    private let collectionView : UICollectionView
    
    // models for collectionView
    
    private var modelsCol = [collectionTableCellM]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        // adding the collection view flowlayout
        let colLayout = UICollectionViewFlowLayout()
        
        colLayout.scrollDirection = .horizontal
        colLayout.itemSize = CGSize(width: 170, height: 170)
        colLayout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: colLayout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(CollectionViewCellWithTabCel.self, forCellWithReuseIdentifier: CollectionViewCellWithTabCel.identifierCol)
        
        // setting the delegate and datasource
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        
        contentView.addSubview(collectionView)
        
            }
    
    // setting the frame for the collectionView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // col models
    
    public func configure(with models: [collectionTableCellM]) {
        self.modelsCol = models
        collectionView.reloadData()
    }
    
    
}

// extension with the collectionview aspects

extension TableViewCellWithColView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return modelsCol.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = modelsCol[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellWithTabCel.identifierCol, for: indexPath) as! CollectionViewCellWithTabCel
        
        cell.configure(with: model)
       
        
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = modelsCol[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelectItem(with: model)
    }
    
}


