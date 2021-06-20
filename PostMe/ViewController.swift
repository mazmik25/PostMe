import UIKit
import Profile

class ViewController: UITabBarController {

    private let feedsViewController: UIViewController = FeedsViewController()
    private let profileViewController: UIViewController = NewProfileWireframe().viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedsViewController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(named: "ic_news_inactive")?.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage(named: "ic_news_active")?.withRenderingMode(.alwaysOriginal)
        )
        profileViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "ic_user_inactive")?.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage(named: "ic_user_active")?.withRenderingMode(.alwaysOriginal)
        )
        
        viewControllers = [
            UINavigationController(rootViewController: feedsViewController),
            UINavigationController(rootViewController: profileViewController)
        ]
    }
}

