//
//  CollectionViewController.swift
//  Carousel
//
//  Created by Justin C. Beck on 1/13/16.
//  Copyright © 2016 BeckProduct. All rights reserved.
//

import UIKit

private let reuseIdentifier = "carouselCell"

class CollectionViewController: UIViewController {

    var dates = Array<Int>()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.registerNib(UINib.init(nibName: "CarouselCellView", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: reuseIdentifier)
        
        for i in 0...19
        {
            dates.append(i + 1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = indexPath.row % 2 == 1 ? UIColor.blackColor() : UIColor.redColor()
        cell.dateLabel.textColor = indexPath.row % 2 == 0 ? UIColor.blackColor() : UIColor.redColor()
        
        cell.layer.borderColor = UIColor.purpleColor().CGColor
        cell.layer.borderWidth = 1.0
        cell.dateLabel.text = "\(indexPath.row)"
    
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        
        if offsetX > contentWidth - scrollView.frame.size.width {
            var end: Int = dates.last!
            var indexPaths = Array<NSIndexPath>()
            
            for _ in 0...19
            {
                end += 1
                dates.append(end)
                
                let indexPath: NSIndexPath = NSIndexPath(forRow: dates.count, inSection: 0)
                indexPaths.append(indexPath)
            }
            
            collectionView.insertItemsAtIndexPaths(indexPaths)
            self.collectionView.reloadData()
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
