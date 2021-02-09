//
//  Coordinator.swift
//  coordinator
//
//  Created by Luat on 2/9/21.
//

import UIKit


class Coordinator {
    var navCon = UINavigationController()
    
//    init() {
//        navCon = UINavigationController()
//    }
    
    func pushFirstVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.coordinator = self
        navCon.pushViewController(vc, animated: true)
    }
    
    func pushProductVC() {
        let vc = ProductViewController.createSelf(sb: "Main")
        navCon.pushViewController(vc, animated: true)
    }
    
    func pushAccountVC() {
        let vc = AccountViewController.createSelf(sb: "Main")
        navCon.pushViewController(vc, animated: true)
    }
    
}

protocol CanCreateSelf {
    static func createSelf(sb: String) -> Self
}

extension CanCreateSelf where Self: UIViewController {
    static func createSelf(sb: String) -> Self {
        let sb = UIStoryboard(name: sb, bundle: nil)
        let id = String(describing: self)
        let vc = sb.instantiateViewController(identifier: id) as! Self
        return vc
    }
}

class RandomClass: UIViewController, CanCreateSelf {

}

