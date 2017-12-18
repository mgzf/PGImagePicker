//
//  PGImagePickerKingfisher.swift
//  PGImagePicker
//
//  Created by piggybear on 2017/10/7.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import PGImagePicker

public class PGImagePickerKingfisher: PGImagePicker {
    
    public var indicatorType: IndicatorType?
    public var placeholder: UIImage?
    public var imageUrls: [String]?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override public func setupImageView(cell: PGCollectionViewCell, indexPath: IndexPath, imageView: UIImageView){
        if imageUrls != nil && indexPath.row < (imageUrls?.count)! {
            let cellImageView: UIImageView =  cell.scrollView.imageView
            let url = URL(string: self.imageUrls![indexPath.row])!
            if self.indicatorType == nil {
                cellImageView.kf.indicatorType = .activity
            }else {
                cellImageView.kf.indicatorType = self.indicatorType!
            }
            if self.placeholder == nil {
                cellImageView.kf.setImage(with: url)
            }else {
                cellImageView.kf.setImage(with: url, placeholder: self.placeholder)
            }
        }else {
            cell.scrollView.imageView.image = imageView.image
        }
    }
}
