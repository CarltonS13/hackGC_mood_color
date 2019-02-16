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
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
