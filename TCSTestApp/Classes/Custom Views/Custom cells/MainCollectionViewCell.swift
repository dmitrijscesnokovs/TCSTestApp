//
//  MainCollectionViewCell.swift
//  TCSTestApp
//
//  Created by Dmitrijs Cesnokovs on 4/23/18.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var beerIconImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    
    static let reuseIdentifier = "MainCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
