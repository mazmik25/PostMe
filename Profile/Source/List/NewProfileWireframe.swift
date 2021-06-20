import Base

public final class NewProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    public init() {
        let moduleViewController = NewProfileViewController()
        super.init(viewController: moduleViewController)

        let interactor = NewProfileInteractor()
        let presenter = NewProfilePresenter(
            view: moduleViewController, 
            interactor: interactor, 
            wireframe: self
        )
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension NewProfileWireframe: NewProfileWireframeInterface {
    func navigate(to option: NewProfileNavigationOption) {
        switch option {
        case .detail(let userId):
            let wireframe: BaseWireframe = NewProfileDetailWireframe(userId: userId)
            navigationController?.pushViewController(wireframe.viewController, animated: true)
        }
    }
}
