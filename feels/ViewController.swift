//
//  ViewController.swift
//  feels
//
//  Created by Carlton Segbefia on 2/15/19.
//  Copyright © 2019 Carlton Segbefia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//static var entry : [String: [String]] = [String: [String]]()
class Singleton{
    var entry = [String: [String]]()
    static let shared = Singleton()
    private init() { }
    
    //use mod to work with 10 possibilities
    
    func addColor(color:String, for key:String){
        entry[key, default: []].append(color)
//        dump(entry[key])
    }
    
    func color(for key: String) -> [String]?{
        return entry[key]
    }
}

