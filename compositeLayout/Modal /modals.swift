//
//  modals.swift
//  compositeLayout
//
//  Created by Venkata harsha Balla on 8/6/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import Foundation

//creating an enum with two cases

enum cellModal {
    
    case collectionView(models: [collectionTableCellM], rows: Int)
    case list(models: [ListCellM])
    
    
}

// creating structs for the parameters

struct ListCellM {
    
    let title: String
    
}

struct collectionTableCellM {
    
    let title: String
    let imageView: String
    
}
