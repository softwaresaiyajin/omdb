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
                year: item.year
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
            actors: data.cast.components(separatedBy: ","),
            duration: data.runTime
        )
    }
}
