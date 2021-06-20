import UIKit
import Base

final class NewProfileDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(userId: Int) {
        let moduleViewController = NewProfileDetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = NewProfileDetailInteractor()
        let presenter = NewProfileDetailPresenter(
            view: moduleViewController,
            interactor: interactor,
            wireframe: self,
            userId: userId
        )
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension NewProfileDetailWireframe: NewProfileDetailWireframeInterface {
}
