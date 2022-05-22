import Combine
import MovieServiceInterface
import Foundation
import AppCore

protocol MovieDetailViewModelInterface: ObservableObject {
    var item: MovieItemDetailedInfo? { get }
    
    func load()
}

final class MovieDetailViewModel: MovieDetailViewModelInterface {
    @Published private(set) var item: MovieItemDetailedInfo?
    
    private let id: String
    private let movieManager: MovieManagerInterface
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        id: String,
        movieManager: MovieManagerInterface
    ) {
        self.id = id
        self.movieManager = movieManager
    }
    
    func load() {
        guard subscriptions.isEmpty else {
            return
        }
        
        movieManager
            .getItem(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure(let error):
                        debugPrint("fetch error: \(error.localizedDescription)")
                      self.item = nil
                    case .finished:
                      break
                    }
                },
                receiveValue: { [weak self] item in
                    self?.item = item
                }
            )
            .store(in: &subscriptions)
    }
}

extension MovieDetailViewModel {
    convenience init(id: String) {
        self.init(
            id: id,
            movieManager: DI.resolve(MovieManagerInterface.self)
        )
    }
}
