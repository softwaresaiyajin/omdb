import MovieServiceInterface

final class MovieListViewModelMock: MovieListViewModelInterface {
    var hasNextPage = true
    var searchText = ""
    var items: [MovieServiceInterface.MovieItemMetadata] = [
        .init(
            id: "tt0268978",
            title: "A Beautiful Mind",
            year: "2001",
            poster: "https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
        ),
        .init(
            id: "tt0118799",
            title: "Life Is Beautiful",
            year: "1997",
            poster: "https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
        ),
        .init(
            id: "tt1559547",
            title: "Beautiful Creatures",
            year: "2013",
            poster: "https://m.media-amazon.com/images/M/MV5BMTQyMjYwODMwMl5BMl5BanBnXkFtZTcwODUwNzY5OA@@._V1_SX300.jpg"
        )
    ]


    func load() {}
    
    func loadNextPage() {}
}
