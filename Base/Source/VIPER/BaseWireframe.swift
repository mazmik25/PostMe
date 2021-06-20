import UIKit

public protocol WireframeInterface: AnyObject {
}

open class BaseWireframe {

    private unowned var _viewController: UIViewController

    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?

    public init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {

}

public extension BaseWireframe {

    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

}

public extension UIViewController {

    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }

}

public extension UINavigationController {

    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }

}
