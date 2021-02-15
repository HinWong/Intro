//
//  ViewController.swift
//  lifeCycle
//
//  Created by Luat on 2/15/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = createDataType()
        writeToFileSystem(data: data, fileURL: createFileURL())
        readFileData()
    
    }

    func readFileData() {
        let data = try? Data(contentsOf: createFileURL())
        let decodedString = String(data: data!, encoding: .utf8)
//        print(decodedString ?? "")
    }
    func createDataType() -> Data? {
        let myString = "Some string to be saved"
        guard let data = myString.data(using: .utf8) else {
            print("Unable to convert string to data")
            return nil
        }
        return data
    }
    func createFileURL() -> URL {
        let urls: [URL] = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: .userDomainMask)
        // /users/documents
        var url = urls.first!
        url.appendPathComponent("file01")
        url.appendPathExtension("jpg")
        return url
    }
    
    func writeToFileSystem(data: Data?, fileURL: URL) {
        // Save the data
        do {
            try data?.write(to: fileURL)
//            print("File saved: \(fileURL.absoluteURL)")
        } catch {
            // Catch any errors
            print(error.localizedDescription)
        }
    }
    
}
