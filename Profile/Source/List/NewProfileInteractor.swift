import Base

final class NewProfileInteractor {
    private let api: ProfileApi
    init(api: ProfileApi) {
        self.api = api
    }
}

// MARK: - Extensions -

extension NewProfileInteractor: NewProfileInteractorInterface {
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        api.getProfiles(completion: completion)
    }
}
