//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.view.addSubview(headerView)
        
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }
}
