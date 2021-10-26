//
//  TabBarViewController.swift
//  Aneeque
//
//  Created by  Decagon on 26/10/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController()
        let profileViewController = ProfilePageViewController()
        let exploreViewController = ExploreViewController()
        let searchViewController = SearchViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([homeViewController, exploreViewController, profileViewController, searchViewController], animated: true)
      guard let items = self.tabBar.items else { return }
      let images = ["person.circle", "bag.fill", "star.fill", "person.fill"]
      for item in 0...3 {
        items[item].image = UIImage(systemName: images[item])
    }
        self.tabBar.tintColor = .black
    }
    
        


}
