//
//  ColorServiceManagerDelegate.swift
//  connectedColors
//
//  Created by user on 1/30/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation

protocol ColorServiceManagerDelegate {
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String])
    func colorChanged(manager: ColorServiceManager, colorString: String)
}
