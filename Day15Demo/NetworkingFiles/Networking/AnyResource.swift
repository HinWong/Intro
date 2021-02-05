
import Foundation

protocol AnyResource {
    associatedtype ModelType: Decodable
    var url: URL { get }
}

struct FeedResouce: AnyResource {
    typealias ModelType = Feed
    var url: URL
    init(countryCode: String = "us", numAlbums: Int = 50) {
        let resourceString = "https://rss.itunes.apple.com/api/v1/\(countryCode)/apple-music/coming-soon/all/\(numAlbums)/explicit.json"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.url = resourceURL
    }
}
