import InternationalizationServiceInterface

enum Slug: String {
    case cast = "movie_detail_header_cast"
    case details = "movie_detail_header_details"
    case yearReleased = "movie_detail_title_year_released"
    case duration = "movie_detail_title_duration"
    case language = "movie_detail_title_language"
    case loadingInfo = "movie_detail_loading_text"
}

extension Slug: SlugIdentifiable {
    var slug: String { rawValue }
}
