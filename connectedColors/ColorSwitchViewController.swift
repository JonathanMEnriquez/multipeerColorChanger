//
//  ViewController.swift
//  connectedColors
//
//  Created by user on 1/30/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ColorSwitchViewController: UIViewController {

    @IBOutlet var connectionsLabel: UILabel!
    
    @IBAction func redTapped(_ sender: UIButton) {
        self.change(color: .red)
        colorService.send(colorName: "red")
    }
    
    @IBAction func yellowTapped(_ sender: UIButton) {
        self.change(color: .yellow)
        colorService.send(colorName: "yellow")
    }
    
    let colorService = ColorServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }
}

extension ColorSwitchViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        self.connectionsLabel.text = "Connections: \(connectedDevices)"
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: String) {
        
        OperationQueue.main.addOperation {
            switch colorString {
            case "red":
                self.change(color: .red)
            case "yellow":
                self.change(color: .yellow)
            default:
                print("unknown Color: \(colorString)")
            }
        }
    }
}
