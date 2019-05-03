//
//  HeaderView.swift
//  sampleStretchyHeaderApp
//
//  Created by Takuma Osada on 2019/05/03.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var animator: UIViewPropertyAnimator!
    
    let imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "blamtaku"))
        image.contentMode = .scaleAspectFill
        return image
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(imageView)
        imageView.fillSuperView()
        setUpVisualEffectBlur()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    private func setUpVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperView()
        })
    }
}
