//
//  FeedCollectionView.swift
//  collectionViewDemo
//
//  Created by Tudip on 02/10/15.
//  Copyright © 2015 Tudip. All rights reserved.
//

import UIKit

class FeedCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
    }
    
    override func awakeFromNib() {
    
    }
    
    

  
    
    func setup() {
        let nipName=UINib(nibName: "SampleCollectionViewCell", bundle:nil)
        collectionView.registerNib(nipName, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: Collection view delegate
extension FeedCollectionView {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("", forIndexPath: indexPath) as! SampleCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
}