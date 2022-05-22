import InternationalizationServiceInterface

enum Slug: String {
    case searchPlaceholder = "movie_list_search_placeholder_text"
    case noMoviesFound = "movie_list_hud_text_no_movies_found"
}

extension Slug: SlugIdentifiable {
    var slug: String { rawValue }
}
