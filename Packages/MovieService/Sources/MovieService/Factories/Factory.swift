import OmdbSDK
import MovieServiceInterface

struct Factory {
    static func makeMovieItemsMetadata(
        data: OmdbSDK.MovieCollection
    ) -> [MovieServiceInterface.MovieItemMetadata] {
        data.items.map { item in
            .init(
                id: item.id,
                title: item.title,
                year: item.year,
                poster: item.poster
            )
        }
    }
    
    static func makeMovieItemDetailedInfo(
        data: OmdbSDK.MovieItemDetailedInfo
    ) -> MovieServiceInterface.MovieItemDetailedInfo {
        .init(
            id: data.id,
            title: data.title,
            year: data.year,
            poster: data.poster,
            plot: data.plot,
            language: data.language,
            actors: data.cast.components(separatedBy: ", "),
            duration: data.runTime
        )
    }
    
    static func makeDefaultMovieItemsMetadata() -> [MovieServiceInterface.MovieItemMetadata] {
        [
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
    }
}
