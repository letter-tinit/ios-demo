//
//  MainTabBarViewController.swift
//  TotalProject
//
//  Created by cuongnh5 on 12/10/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let contactController = UINavigationController(rootViewController: ContactController())
        
        let photoController = UINavigationController(rootViewController: PhotoViewController())
        
        contactController.tabBarItem.image = UIImage(systemName: "person")
        photoController.tabBarItem.image = UIImage(systemName: "photo")

        contactController.title = "Contact"
        photoController.title = "Photo"
        
        tabBar.tintColor = .label
        tabBar.isTranslucent = false
        
        setViewControllers([contactController, photoController],  animated: true)
        
    }

}
