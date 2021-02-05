
import Foundation


protocol NetworkRequest {
    associatedtype ModelType
    func decode(data: Data) -> ModelType?
    func loadAndDecode(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func load(url: URL, completion: @escaping (ModelType?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print(String(describing: error))
                completion(nil)
                return
            }
            completion(self.decode(data: data))
        }.resume()
    }
}
