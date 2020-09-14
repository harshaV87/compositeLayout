//
//  CollectionViewCellWithTabCel.swift
//  compositeLayout
//
//  Created by Venkata harsha Balla on 8/6/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import UIKit

class CollectionViewCellWithTabCel: UICollectionViewCell {
    
    static let identifierCol = "tableViewCol"
    
    private let colLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
        
    }()
    
    private let colImageView: UIImageView = {
        
        let imageViewC = UIImageView()
        
        return imageViewC
        
    }()
    
    public func configure(with colModel: collectionTableCellM) {
        
        colLabel.text = colModel.title
        
        colImageView.image = UIImage(named: colModel.imageView)
        
    }
    
    // adding the label and imageview to the cell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(colLabel)
        contentView.addSubview(colImageView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        colImageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 55)
        
        colLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
