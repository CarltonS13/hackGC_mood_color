//
//  PickerViewController.swift
//  feels
//
//  Created by Carlton Segbefia on 2/15/19.
//  Copyright © 2019 Carlton Segbefia. All rights reserved.
//

import UIKit
import ChromaColorPicker

class PickerViewController: UIViewController {
    
    var colorPicker: ChromaColorPicker!
//    var tabBarController: UITabBarController? { get }

    @IBAction func doneBtnPressed(_ sender: Any) {
        let singleton = Singleton.shared
        singleton.addColor(color: colorPicker.currentColor, for: 0)
        tabBarController?.selectedIndex = 1
        
    }
    
    func loadData(){
        let singleton = Singleton.shared
        let a =  UIColor(red:0.94, green:0.76, blue:0.48, alpha:1.0)
        let b = UIColor(red:0.29, green:0.07, blue:0.28, alpha:1.0)
        let c = UIColor(red:0.13, green:0.23, blue:0.26, alpha:1.0)
        let cc = UIColor(red:0.17, green:0.33, blue:0.39, alpha:1.0)
        let ccc = UIColor(red:0.06, green:0.13, blue:0.15, alpha:1.0)
        
        
        singleton.addColor(color: UIColor.red, for: 1)
        singleton.addColor(color: UIColor.blue, for: 4)
        
        singleton.addColor(color: UIColor.green, for: 3)
        singleton.addColor(color: UIColor.orange, for: 3)
        singleton.addColor(color: UIColor.yellow, for: 3)
        
        singleton.addColor(color: UIColor.purple, for: 5)
        singleton.addColor(color: UIColor.blue, for: 6)
        singleton.addColor(color: UIColor.red, for: 2)
        
        singleton.addColor(color: c, for: 4)
        singleton.addColor(color: cc, for: 4)
        singleton.addColor(color: ccc, for: 4)
        
        singleton.addColor(color: a, for: 6)
        singleton.addColor(color: c, for: 7)
        singleton.addColor(color: b, for: 3)
        
        singleton.addColor(color: a, for: 1)
        singleton.addColor(color: UIColor.blue, for: 2)
        singleton.addColor(color: UIColor.orange, for: 4)
        
        singleton.addColor(color: a, for: 0)
        singleton.addColor(color: UIColor.lightGray, for: 6)
        singleton.addColor(color: b, for: 2)
        
        singleton.addColor(color: UIColor.brown, for: 7)
        singleton.addColor(color: UIColor.magenta, for: 3)
        singleton.addColor(color: ccc, for: 0)
        
        singleton.addColor(color: UIColor.yellow, for: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        
        let pickerSize = CGSize(width: view.bounds.width*0.8, height: view.bounds.width*0.8)
        let pickerOrigin = CGPoint(x: view.bounds.midX - pickerSize.width/2, y: view.bounds.midY - pickerSize.height/2)
        
        /* Create Color Picker */
        colorPicker = ChromaColorPicker(frame: CGRect(origin: pickerOrigin, size: pickerSize))
        
        /* Customize the view (optional) */
        colorPicker.padding = 10
        colorPicker.stroke = 15 //stroke of the rainbow circle
        colorPicker.currentAngle = Float.pi
        
        /* Customize for grayscale (optional) */
        colorPicker.supportsShadesOfGray = false // false by default
        //colorPicker.colorToggleButton.grayColorGradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.gray.cgColor] // You can also override gradient colors
        colorPicker.handleLine.lineWidth = 2.5
        colorPicker.handleLine.strokeColor = UIColor.lightGray.cgColor
        colorPicker.handleLine.isHidden = false
        colorPicker.hexLabel.isHidden = true
        
        /* Don't want an element like the shade slider? Just hide it: */
        //colorPicker.shadeSlider.hidden = true
        
        self.view.addSubview(colorPicker)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
