import UIKit

struct Peron: Equatable, Comparable, Hashable {
    static func < (lhs: Peron, rhs: Peron) -> Bool {
        return lhs.age < rhs.age
    }
    static func == (lhs: Peron, rhs: Peron) -> Bool {
        return lhs.age == rhs.age &&
            lhs.name == rhs.name &&
            lhs.job.title == rhs.job.title
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
    let name: String
    let age: Int
    let job: Job
}
struct Job {
    let title: String
}
let person1 = Peron(name: "Luke", age: 32, job: Job(title: "dev"))
let person2 = Peron(name: "Bil", age: 33, job: Job(title: "dev"))
//if person1 == person2 {
//    print("same person")
//} else {
//    print("not same")
//}
//if person1 < person2 {
//    print("person one is younger")
//} else {
//    print("person one is older")
//}
var peopleDictionary: [Peron: Int] = [:]





/// Closures

class Tester {
    var image: UIImage?
    var helper = Helper()
    func getImage() {
        helper.downloadImage(completionHandler: { img in
            self.image = img
            print("finished completionHandler")
        })
        print("finished getImage()")
    }
}
struct Helper {
    func downloadImage(completionHandler: @escaping (UIImage?) -> ()) {
        print("starting download")
        var image: UIImage?
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            print("finishing download")
            image = UIImage(systemName: "pencil")
            print("image in async func,")
            completionHandler(image)
        }
        print("end of function")
//        if let image = image {
//            return image
//        } else {
//            return nil
//        }
    }
}
let tester = Tester()
tester.getImage()
print(tester.image) // nil


/// ImageSingleton
/// prinvate init
/// static access variable/let
class ImageSingleton {
    
//    var images: [UIImage] = []
//    var diction = Dictionary<String, Int>()
    var imageCache = NSCache<NSString, UIImage>()
    
    static let shared = ImageSingleton()
    
    private init() {}
    
    func addImage() {
        ///
        if let cachedImage = imageCache.object(forKey: "urlString") {
            /// use cachedImage
            print(cachedImage)
        } else {
            /// download image and set object in imageCahce
            if let pencil = UIImage(systemName: "pencil") {
                imageCache.setObject(pencil, forKey: "urlString")
            }
        }
    }
}

let imageS = ImageSingleton.shared
let imageS2 = ImageSingleton.shared
