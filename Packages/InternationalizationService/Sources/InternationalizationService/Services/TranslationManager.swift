import InternationalizationServiceInterface
import Foundation

final class TranslationManager: TranslationManagerInterface {
    private lazy var defaultBundle: Bundle = {
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")!
        return .init(path: path)!
    }()

    func string<Slug>(forKey key: Slug) -> String where Slug : SlugIdentifiable {
        string(forKey: key.slug, defaultValue: key.slug)
    }
    
    func string<Slug>(forKey key: Slug, defaultValue: String) -> String where Slug : SlugIdentifiable {
        string(forKey: key.slug, defaultValue: defaultValue)
    }
    
    func string(forKey key: String) -> String {
        string(forKey: key, defaultValue: key)
    }
    
    func string(forKey key: String, defaultValue: String) -> String {
        NSLocalizedString(
            key,
            tableName: nil,
            bundle: defaultBundle,
            value: defaultValue,
            comment: ""
        )
    }
    
    
}
