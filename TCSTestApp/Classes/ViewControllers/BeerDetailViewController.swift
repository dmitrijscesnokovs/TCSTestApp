//
//  BeerDetailViewController.swift
//  TCSTestApp
//
//  Created by Dmitrijs Cesnokovs on 23/04/2018.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import UIKit
import Kingfisher

class BeerDetailViewController: UIViewController {

    // MARK: Internal vars
    var beer: Beer!
    
    // MARK: Outlets
    @IBOutlet weak var beerIconImageView: UIImageView!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerIngredientsLabel: UILabel!

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUIValues()
    }
    
    // MARK: UI methods
    
    func setUIValues()
    {
        if let beerName = beer.name
        {
           self.title = beerName
        }
        
        if let url = beer.image_url
        {
            let imageUrl = URL(string:url)
            beerIconImageView.kf.indicatorType = .activity
            beerIconImageView.kf.setImage(with: imageUrl)
        }
        
        if let tagLine = beer.tagline
        {
            beerTaglineLabel.text = tagLine
        }
        
        //Build ingredients string
        var ingredients = ""
        if let malts = beer.ingredients?.malt
        {
            for malt in malts
            {
                if let ingredientName = (malt as! Malt).name
                {
                    ingredients += ingredientName + ", "
                }
            }
            ingredients = String(ingredients.dropLast(2))
        }
        
        beerIngredientsLabel.text = ingredients
        beerIngredientsLabel.sizeToFit()
    }
}
