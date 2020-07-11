//
//  EFButton.swift
//  EFUIKit
//
//  Created by Edno Fedulo on 11/07/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class EFButton: UIButton {

    private var didSetupShadow:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentEdgeInsets = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = self.frame.height/2
        
        if self.layer.cornerRadius != cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        setupShadow()
    }
    
    private func setupShadow(){
        
        guard !didSetupShadow else { return }
        
        self.layer.shadowColor = self.backgroundColor?.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: self.frame.height/4)
        self.layer.shadowRadius = 10
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.didSetupShadow = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
