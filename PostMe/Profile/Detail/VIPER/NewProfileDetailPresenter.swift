import Foundation

final class NewProfileDetailPresenter {

    // MARK: - Private properties -

    private weak var view: NewProfileDetailViewInterface?
    private let interactor: NewProfileDetailInteractorInterface
    private let wireframe: NewProfileDetailWireframeInterface

    // MARK: - Lifecycle -

    init(view: NewProfileDetailViewInterface, interactor: NewProfileDetailInteractorInterface, wireframe: NewProfileDetailWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension NewProfileDetailPresenter: NewProfileDetailPresenterInterface {
}
