import UIKit

class ViewController: UIViewController {
    
    var label = "needs data"
    var delegate: HelperDelegate? = HelperDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for num in 0...5000 {
//            let person = Person() // ref count 1
//            var phone = Phone() // ref count 1
//            person.phone = phone // ref count 2
//            phone.person = person // ref count 2
            print(num)
            fetchData()
        }
    }

    func fetchData() {
        delegate?.getData { [weak self] updatedData in
            guard let strongSelf = self else {
                fatalError()
            }
            strongSelf.label = updatedData
            
            if let welf = self {
                welf.label = updatedData
            }
            
        }
    }

}

class Person {
    var phone: Phone?
    deinit {
        print("person de-init")
    }
}

struct Phone {
    var person: Person?
}

class ViewControllerTwo: UIViewController {
    var delegate: HelperDelegate?
    deinit {
        print("ViewControllerTwo de-init")
    }
}

class HelperDelegate {
    
    var vc: UIViewController?
    
    func getData(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            let data = "data"
            completion(data)
        }
    }
    
    deinit {
        print("HelperDelegate de-init")
    }
}
