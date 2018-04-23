//
//  ViewController.swift
//  TCSTestApp
//
//  Created by Dmitrijs Cesnokovs on 4/22/18.
//  Copyright © 2018 DCSoftwareDevelopment. All rights reserved.
//

import UIKit
import Sync
import Kingfisher
import SwiftSpinner

class OverviewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Internal vars
    var beers = [Beer]()
    
    // MARK: Outlets
    @IBOutlet weak var beerCollectionView: UICollectionView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        
        self.title = "Beers"
        
        self.beers = CoreDataService.shared.fetchBeers()
        
        self.refresh()
    }
    
    // MARK: CollectionView
    
    func configureCollectionView(){
        beerCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier)
        let layout = beerCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! MainCollectionViewCell
        let beer = self.beers[indexPath.row]
        
        if let beerName = beer.name
        {
            cell.beerNameLabel.text = beerName
        }
        
        if let url = beer.image_url
        {
            let imageUrl = URL(string:url)
            cell.beerIconImageView.kf.indicatorType = .activity
            cell.beerIconImageView.kf.setImage(with: imageUrl)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width/3
        let height = self.view.frame.size.height/3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let beer = self.beers[indexPath.row]
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BeerDetailViewController") as! BeerDetailViewController
        controller.beer = beer
        self.navigationController?.pushViewController(controller, animated: true)

    }
    
    // MARK: Datasource methods

    @objc func refresh() {
        SwiftSpinner.show("Downloading latest beers")
        NetworkService.shared.getBeers { result in
            switch result {
            case .success:
                self.beers = CoreDataService.shared.fetchBeers()
                self.beerCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
            SwiftSpinner.hide()
        }
    }
}
