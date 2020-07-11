//
//  EFCardView.swift
//  EFUIKit
//
//  Created by Edno Fedulo on 11/07/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class EFCardView: UIView {
    
    private var didSetupShadow:Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow()
    }
    
    private func setupShadow(){
        
        guard !didSetupShadow else { return }
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.didSetupShadow = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

