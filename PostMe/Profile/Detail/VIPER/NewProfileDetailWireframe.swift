import UIKit

final class NewProfileDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = NewProfileDetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = NewProfileDetailInteractor()
        let presenter = NewProfileDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension NewProfileDetailWireframe: NewProfileDetailWireframeInterface {
}
