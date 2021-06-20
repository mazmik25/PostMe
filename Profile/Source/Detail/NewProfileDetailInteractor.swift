import Base

final class NewProfileDetailInteractor {
    private let api: ProfileApi
    init(api: ProfileApi) {
        self.api = api
    }
}

// MARK: - Extensions -

extension NewProfileDetailInteractor: NewProfileDetailInteractorInterface {
    func getDetailProfile(
        userId: Int,
        completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void
    ) {
        api.getDetailProfile(userId: userId, completion: completion)
    }
}
