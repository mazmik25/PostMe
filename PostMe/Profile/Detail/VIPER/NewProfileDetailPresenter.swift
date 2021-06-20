import Foundation

final class NewProfileDetailPresenter {

    // MARK: - Private properties -

    private weak var view: NewProfileDetailViewInterface?
    private let interactor: NewProfileDetailInteractorInterface
    private let wireframe: NewProfileDetailWireframeInterface

    private var userId: Int = 0
    // MARK: - Lifecycle -

    init(
        view: NewProfileDetailViewInterface,
        interactor: NewProfileDetailInteractorInterface,
        wireframe: NewProfileDetailWireframeInterface,
        userId: Int
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.userId = userId
    }
}

// MARK: - Extensions -

extension NewProfileDetailPresenter: NewProfileDetailPresenterInterface {
    func getDetailProfile() {
        interactor.getDetailProfile(userId: userId) { [weak self] result in
            switch result {
            case .success(let response):
                let profile: ProfileBodyResponse? = response.first
                let viewModels: [ProfileViewModel] = [
                    ProfileViewModel(id: self?.userId, title: "Name", subtitle: profile?.name),
                    ProfileViewModel(id: self?.userId, title: "Address", subtitle: profile?.fullAdress),
                    ProfileViewModel(id: self?.userId, title: "Company", subtitle: profile?.companyProfile)
                ]
                self?.view?.reloadData(viewModels: viewModels)
            case .failure(let error):
                print(error)
            }
        }
    }
}
