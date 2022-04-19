//
//  LoadingGif.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 19.04.2022.
//

import Foundation
import UIKit

class LoadingGif: UIView {
    
    var imageViewForGif: UIImageView!
    var imagesName: String!
    var duration: Double!
    var repeatCount: Int!
    
    
   
    init(imageName: String, frame: CGRect, duration: Double, repeatCount: Int) {
        self.imagesName = imageName
        super.init(frame: frame)
        imageViewForGif = UIImageView(image: UIImage(named: imagesName))
        handleAnimation(imageName: imageName, duration: duration, repeatCount: repeatCount)
        addSubview(imageViewForGif)
        backgroundColor = UIColor.init(red: 24/255, green: 19/255, blue: 56/255, alpha: 1.0)
        
        imageViewForGif.contentMode = .scaleAspectFill
    }
   
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewForGif.frame = bounds
        layer.cornerRadius = frame.size.width / 2
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    func handleAnimation(imageName: String, duration: Double, repeatCount: Int) {
        imageViewForGif.animationImages = animatedImages(for: imageName)
        imageViewForGif.animationDuration = duration
        imageViewForGif.animationRepeatCount = repeatCount
        imageViewForGif.image = imageViewForGif.animationImages?.first
    }
    
    func startAnimation() {
        imageViewForGif.startAnimating()
    }
    
    func stopAnimation() {
        imageViewForGif.stopAnimating()
    }
    
    func animatedImages(for name: String) -> [UIImage] {
        var i = 1
        var images = [UIImage]()
        while let image = UIImage(named: "\(name)/logoGif-\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    
}
