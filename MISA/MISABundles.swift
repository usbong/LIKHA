//
//  MISABundles.swift
//  MISA
//
//  Created by Chris Amanse on 06/08/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import Foundation
import UsbongKit

struct MISABundles {
    static let bundlesDictionary = (NSDictionary(contentsOfURL: NSBundle.mainBundle().URLForResource("MISABundles", withExtension: "plist")!) as? Dictionary<String, [String]>) ?? [:]
}

extension MISABundles {
    static var bundles: [IAPBundle] {
        // Create bundles based on dictionary
        let dict = bundlesDictionary
        
        var bundles: [IAPBundle] = []
        
        for (identifier, languages) in dict {
            bundles.append(IAPBundle(productIdentifier: identifier, languages: languages))
        }
        
        return bundles
    }
}
