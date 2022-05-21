import Combine
import MovieServiceInterface

public protocol MovieListViewModelInterface: ObservableObject {
    var searchText: String { get set }
    var items: [MovieServiceInterface.MovieItemMetadata] { get set }
    func load()
}

final class MovieListViewModel: MovieListViewModelInterface {
    @Published var searchText = ""
    @Published var items: [MovieServiceInterface.MovieItemMetadata] = []
    
    private let movieManager: MovieManagerInterface
    private var subscriptions: Set<AnyCancellable> = []
    
    init(movieManager: MovieManagerInterface) {
        self.movieManager = movieManager
    }
    
    func load() {
        
    }
}
