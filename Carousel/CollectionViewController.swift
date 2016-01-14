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
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.registerNib(UINib.init(nibName: "CarouselCellView", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: reuseIdentifier)
        
        for i in 0...19
        {
            dates.append(i + 1)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.collectionView!.contentOffset = CGPointMake(1000, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = abs(dates[indexPath.row] % 2) == 1 ? UIColor.blackColor() : UIColor.redColor()

        cell.dateLabel.textColor = abs(dates[indexPath.row] % 2) == 0 ? UIColor.blackColor() : UIColor.redColor()
        cell.dateLabel.text = "\(dates[indexPath.row])"
    
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let visibleCells = collectionView.visibleCells()
        let visibleCell = visibleCells[visibleCells.count / 2]
        let visibleIndexPath = collectionView.indexPathForCell(visibleCell)
        
        if visibleIndexPath!.row > (dates.count - 6)
        {
            var end: Int = dates.last!
            
            for _ in 0...3
            {
                end += 1
                dates.append(end)
                
                self.collectionView.reloadData()
            }
        }
        else if visibleIndexPath!.row < 3
        {
//            var begin: Int = dates.first!
//            var indexPaths = Array<NSIndexPath>()
//            
//            for _ in 0...3
//            {
//                begin -= 1
//                dates.insert(begin, atIndex: 0)
//                let indexPath = NSIndexPath(forItem: 0, inSection: 0)
//                indexPaths.insert(indexPath, atIndex: 0)
//                
//                debugPrint(begin)
//                debugPrint(dates.count)
//            }
//            
//            collectionView.insertItemsAtIndexPaths(indexPaths)
        }
        
    }

    @IBAction func buttonTapped(sender: AnyObject) {
//        dates.append(9)
        dates.insert(9, atIndex: 0)
        collectionView.contentOffset.x = collectionView.contentOffset.x + CGFloat(100.0)
        collectionView.reloadData()
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
