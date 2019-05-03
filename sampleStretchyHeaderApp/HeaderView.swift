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
        setUpGradientLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    private func setUpGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.bounds 
        gradientLayer.frame.origin.y -= self.bounds.height
        
        let heavyLabel = UILabel()
        heavyLabel.text = "おさたく @ostk0069"
        heavyLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        heavyLabel.textColor = .white
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "東京理科大学経営学部 github.com/takumaosada Swift Rails Vue.js とかよく書いています"
        descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 14.0)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [heavyLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
    }
    
    private func setUpVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperView()
        })
        animator.fractionComplete = 0
    }
}
