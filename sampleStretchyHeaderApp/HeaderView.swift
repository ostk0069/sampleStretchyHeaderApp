//
//  HeaderView.swift
//  sampleStretchyHeaderApp
//
//  Created by Takuma Osada on 2019/05/03.
//  Copyright © 2019 Takuma Osada. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
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
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
}
