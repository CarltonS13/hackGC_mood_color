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
    var entry = [Int: [UIColor]]()
    static let shared = Singleton()
    private init() { }
    
    //use mod to work with 7 possibilities
    //aka days of the week
    
    func addColor(color:UIColor, for key:Int){
        entry[key, default: []].append(color)
//        dump(entry[key])
    }
    
    func color(for key: Int) -> [UIColor]?{
        return entry[key]
    }
}

