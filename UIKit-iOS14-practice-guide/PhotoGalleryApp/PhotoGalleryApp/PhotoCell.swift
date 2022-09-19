//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by 조주은 on 2022/09/19.
//

import UIKit
import PhotosUI

class PhotoCell: UICollectionViewCell {
    
    func loadImage(asset: PHAsset) {
        
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)  // 화면에 150 150 크기로 들어감
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        
        self.photoImageView.image = nil
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
            
//            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
//                // 저화질
//            } else {
//                //고화질
//            }
            
            self.photoImageView.image = image
        }
        
    }
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
}
