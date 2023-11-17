//
//  OneVC.swift
//  AutoBanner
//
//  Created by 강조은 on 2023/11/14.
//

import UIKit

class OneVC: UIViewController {
    
    let oneView = OneView()
    var timer: TimerManager?
    var nowPage: Int = 0

    let dataArray: [UIImage] = [UIImage(named: "image1")!,
                                UIImage(named: "image2")!,
                                UIImage(named: "image3")!,
                                UIImage(named: "image4")!]
    
    override func loadView() {
        view = oneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneView.banner.collectionView.delegate = self
        oneView.banner.collectionView.dataSource = self
        
        initTimer()
    }
    
    func initTimer() {
        let info = TimerInfo(type: .down, isRepeat: true, durationTime: 2.0)
        timer = TimerManager()
        timer?.initalize(timerInfo: info)
        timer?.endHandler = {  time in
            self.bannerMove()
        }
        timer?.start()
    }
    
     func bannerMove() {
         if nowPage == dataArray.count-1 {
             oneView.banner.collectionView.isPagingEnabled = false
             oneView.banner.collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
             oneView.banner.collectionView.isPagingEnabled = true
             nowPage = 0
             return
         }
         nowPage += 1
         oneView.banner.collectionView.isPagingEnabled = false
         oneView.banner.collectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
         oneView.banner.collectionView.isPagingEnabled = true
     }
}

extension OneVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = oneView.banner.collectionView.dequeueReusableCell(withReuseIdentifier: "AutoBannerCVCell", for: indexPath) as? AutoBannerCVCell else {return UICollectionViewCell() }
        cell.imageView.image = dataArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: oneView.banner.collectionView.frame.size.width,
                      height:  oneView.banner.collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.reset()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer?.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
