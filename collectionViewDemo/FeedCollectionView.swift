//
//  FeedCollectionView.swift
//  collectionViewDemo
//
//  Created by Tudip on 02/10/15.
//  Copyright © 2015 Tudip. All rights reserved.
//

import UIKit

class FeedCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var myButton: UIButton!
  @IBOutlet weak var nibView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
    }
    
    override func awakeFromNib() {
      super.awakeFromNib()
      setup()
    }
  
  func addNibSubview(nibName: String) -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    view.frame = CGRect(origin: CGPointZero, size: bounds.size)
    view.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    addSubview(view)
    return view
  }
    
    func setup() {
        nibView = addNibSubview("FeedCollectionView")
        let nipName = UINib(nibName: "SampleCollectionViewCell", bundle:nil)
        collectionView.registerNib(nipName, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
      SampleCollectionViewCell.registerCellNib(collectionView)
    }
}

// MARK: Collection view delegate
extension FeedCollectionView {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SampleCollectionViewCell
      cell.nameLabel.text = "Hii jatin"
            return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: 116, height: 148)
  }
  

    
}

extension UICollectionViewCell {
  class func registerCellNib(collectionView: UICollectionView) {
    let bundle = NSBundle(forClass: self)

    collectionView.registerNib(UINib(nibName: "SampleCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "cell")
  }
}
