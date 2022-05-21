import MovieServiceInterface

final class MovieListViewModelMock: MovieListViewModelInterface {
    var searchText = ""
    var items: [MovieServiceInterface.MovieItemMetadata] = [
        .init(id: "tt0268978", title: "A Beautiful Mind", year: "2001"),
        .init(id: "tt0118799", title: "Life Is Beautiful", year: "1997"),
        .init(id: "tt1559547", title: "Beautiful Creatures", year: "2013")
    ]


    func load() {}
}
