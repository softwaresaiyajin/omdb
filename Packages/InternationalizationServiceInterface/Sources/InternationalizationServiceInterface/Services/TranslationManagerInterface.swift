import Foundation

public protocol TranslationManagerInterface {
    func string<Slug: SlugIdentifiable>(forKey key: Slug) -> String
    func string<Slug: SlugIdentifiable>(forKey key: Slug, defaultValue: String) -> String
    func string(forKey key: String) -> String
    func string(forKey key: String, defaultValue: String) -> String
}

// For convenience
public var defaultTranslationManager: TranslationManagerInterface?

public prefix func ~ <Slug: SlugIdentifiable>(key: Slug) -> String {
    guard let defaultTranslationManager = defaultTranslationManager else {
        return key.slug
    }
    return defaultTranslationManager.string(forKey: key)
}
