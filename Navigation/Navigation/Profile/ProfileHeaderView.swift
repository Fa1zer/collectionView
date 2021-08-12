//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView, UITextViewDelegate {
    override init(frame: CGRect)  {
        super.init(frame: frame)
        
        status.text = "Вы можете добавить статус"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText = String()
    
    private var image: UIImageView = {
        let image = UIImage(named: "baby yoda")
        let imageView = UIImageView(image: image)
        
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        
        return imageView
    }()
    
    private var name: UILabel = {
        let name = UILabel()
        
        name.text = "Baby Yoda"
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        name.sizeToFit()

        return name
    }()
    
    private var statusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.addTarget(self, action: #selector(buttonPressed),
                         for: .touchUpInside)
        
        return button
    }()
    
    private var status: UILabel = {
        let status = UILabel()
        
        status.textColor = .gray
        status.textAlignment = .center
        status.font = UIFont.systemFont(ofSize: 14,
                                        weight: UIFont.Weight.regular)

        return status
    }()
    
    private var editStatus: UITextField = {
        var edit = UITextField()
        
        edit.font = UIFont.systemFont(ofSize: 15,
                                      weight: UIFont.Weight.regular)
        edit.tintColor = .black
        edit.backgroundColor = .white
        edit.layer.cornerRadius = 12
        edit.layer.borderWidth = 1
        edit.layer.borderColor = UIColor.black.cgColor
        edit.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return edit
    }()
    
    @objc func buttonPressed() {
        print(status.text!)
        status.text = statusText
        status.sizeToFit()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? status.text!
    }
    
    override func layoutSubviews() {
        image.frame = CGRect(x: 16, y: 16,
                             width: frame.width / 4 - 16,
                             height: frame.width / 4 - 16)
        image.layer.cornerRadius = image.frame.height / 2
        
        name.frame = CGRect(x: frame.width / 2 - name.frame.width / 2,
                            y: image.frame.minY + 11, width: name.frame.width,
                            height: name.frame.height)
        
        status.sizeToFit()
        status.frame = CGRect(x: name.frame.minX,
                              y: image.frame.maxY - (18 + status.frame.height),
                              width: status.frame.width,
                              height: status.frame.height)
        
        editStatus.frame =  CGRect(x: status.frame.minX,
                                  y: image.frame.maxY - 11,
                                  width: frame.width - status.frame.minX - 16,
                                  height: 40)

        statusButton.frame = CGRect(x: 16, y: editStatus.frame.maxY + 16,
                                    width: frame.width - 32, height: 50)
        
        addSubview(image)
        addSubview(name)
        addSubview(statusButton)
        addSubview(status)
        addSubview(editStatus)
    }
}
