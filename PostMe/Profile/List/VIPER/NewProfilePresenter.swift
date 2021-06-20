import Foundation

final class NewProfilePresenter {

    // MARK: - Private properties -

    private weak var view: NewProfileViewInterface?
    private let interactor: NewProfileInteractorInterface
    private let wireframe: NewProfileWireframeInterface

    // MARK: - Lifecycle -

    init(
        view: NewProfileViewInterface, 
        interactor: NewProfileInteractorInterface, 
        wireframe: NewProfileWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension NewProfilePresenter: NewProfilePresenterInterface {
    func getProfiles() {
        interactor.getProfiles { [weak self] result in
            switch result {
            case .success(let response):
                let viewModels: [ProfileViewModel] = response.compactMap {
                    ProfileViewModel(
                        id: $0.id,
                        title: "Name",
                        subtitle: $0.name
                    )
                }
                self?.view?.reloadData(viewModels: viewModels)
            case .failure(let error): print(error)
            }
        }
    }
    
    func viewDetail(profile: ProfileViewModel) {
        if let userId: Int = profile.id {
            wireframe.navigate(to: .detail(userId: userId))
        }
    }
}
