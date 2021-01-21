//
//  ImageViewController.swift
//  imageAndSegues
//
//  Created by Luat on 1/21/21.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            print("IBOutlet is hooked up")
        }
    }
    
    var imageURL: URL? {
        didSet {
            print("setting url")
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        fetchImage()
    }
    
    func fetchImage() {
        guard let imageURL = imageURL else { fatalError() }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let downloadedData = try? Data(contentsOf: imageURL)
            if let downloadedData = downloadedData {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: downloadedData)
                }
            }
        }
        
//        if let imageURL = imageURL {
//        }
        
    }

}
