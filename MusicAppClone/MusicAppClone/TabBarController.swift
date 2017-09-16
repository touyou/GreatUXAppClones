//
//  ViewController.swift
//  MusicAppClone
//
//  Created by 藤井陽介 on 2017/09/15.
//  Copyright © 2017年 藤井陽介. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Tab Items
    
    internal enum TabItem: Int {
        
        case library, forYou, find, radio, search
        
        var viewController: UIViewController {
            
            switch self {
            case .library:
                return UINavigationController(rootViewController: LibraryViewController.instantiate())
            case .forYou:
                return UIViewController()
            case .find:
                return UIViewController()
            case .radio:
                return UIViewController()
            case .search:
                return UIViewController()
            }
        }
        
        var title: String {
            
            switch self {
            case .library:
                return "ライブラリ"
            case .forYou:
                return "For You"
            case .find:
                return "見つける"
            case .radio:
                return "Radio"
            case .search:
                return "検索"
            }
        }
        
        var iconImage: UIImage? {
            
            switch self {
            case .library:
                return nil
            case .forYou:
                return nil
            case .find:
                return nil
            case .radio:
                return nil
            case .search:
                return nil
            }
        }
    }
    
    internal var tabItems: [TabItem] = [.library, .forYou, .find, .radio, .search]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewControllers: [UIViewController] = []
        tabItems.enumerated().forEach { index, item in
        
            let viewController = item.viewController
            if let image = item.iconImage {
                
                viewController.tabBarItem.image = image
            }
            viewController.tabBarItem.title = item.title
            viewControllers.append(viewController)
        }
        
        self.viewControllers = viewControllers
        
        tabBar.tintColor = UIColor.MusicApp.magenta
    }
}

// MARK: - Storyboard Instantiable

extension TabBarController: StoryboardInstantiable {}
