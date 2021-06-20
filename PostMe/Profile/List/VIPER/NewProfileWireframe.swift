import UIKit

final class NewProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = NewProfileViewController()
        super.init(viewController: moduleViewController)

        let interactor = NewProfileInteractor()
        let presenter = NewProfilePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension NewProfileWireframe: NewProfileWireframeInterface {
    func navigate(to option: NewProfileNavigationOption) {
        switch option {
        case .detail(let userId):
            let viewController: ProfileDetailViewController = ProfileDetailViewController()
            viewController.id = userId
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
