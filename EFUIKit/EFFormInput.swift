//
//  EFFormInput.swift
//  EFUIKit
//
//  Created by Edno Fedulo on 11/07/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class EFFormInput: UIView {

    var label:String = "" {
        didSet {
            self.uilabel.text = label
        }
    }
    
    var value:String {
        get {
            return self.textField.text ?? ""
        }
    }
    
    lazy var labelView: UIView = {
        let view = UIView()
        view.addSubview(uilabel)
        NSLayoutConstraint.activate([
            uilabel.topAnchor.constraint(equalTo: view.topAnchor),
            uilabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uilabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: uilabel.bottomAnchor)
        ])
        return view
    }()
    
    lazy var uilabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    lazy var textField: EFTextField = {
        let textField = EFTextField()
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return textField
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor)
        ])
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.textField.backgroundColor = .systemFill
        self.textField.layer.cornerRadius = 15
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
        ])
        
        self.stackView.addArrangedSubview(labelView)
        self.stackView.addArrangedSubview(textField)
        self.stackView.addArrangedSubview(infoView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setError(with msg:String) {
        self.infoLabel.text = msg
        self.infoView.alpha = 0
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.infoView.alpha = 1.0
            self.textField.layer.borderWidth = 1
            self.textField.layer.borderColor = UIColor.systemRed.cgColor
        })
    }
    
    func clearError(){
        self.infoLabel.text = ""
        self.infoView.alpha = 0.0
        self.textField.layer.borderWidth = 0
        self.textField.textColor = .label
    }
    
    func hasError() -> Bool {
        if let errorText = self.infoLabel.text, !errorText.isEmpty {
            return true
        }
        return false
    }
}
