//
//  UIImageViewExtension.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import Kingfisher

extension UIImageView {
    
    func setImage(url: URL?, size: CGSize = CGSize(width: 200, height: 200)) {
        let processor = DownsamplingImageProcessor(size: size)
        kf.indicatorType = .activity
        kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ])
    }
}
