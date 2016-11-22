//
//  FeedCollectionView.swift
//  collectionViewDemo
//
//  Created by Jatin on 02/10/15.
//  Copyright © 2015 Jatin. All rights reserved.
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
  
  func addNibSubview(_ nibName: String) -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.frame = CGRect(origin: CGPoint.zero, size: bounds.size)
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    addSubview(view)
    return view
  }
    
    func setup() {
        nibView = addNibSubview("FeedCollectionView")
        let nipName = UINib(nibName: "SampleCollectionViewCell", bundle:nil)
        collectionView.register(nipName, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
      SampleCollectionViewCell.registerCellNib(collectionView)
    }
}

// MARK: Collection view delegate
extension FeedCollectionView {
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SampleCollectionViewCell
      cell.nameLabel.text = "Hii jatin"
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
  @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 116, height: 148)
  }
  

    
}

extension UICollectionViewCell {
  class func registerCellNib(_ collectionView: UICollectionView) {
    let bundle = Bundle(for: self)

    collectionView.register(UINib(nibName: "SampleCollectionViewCell", bundle: bundle), forCellWithReuseIdentifier: "cell")
  }
}
