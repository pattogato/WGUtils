//
//  RealmUtils.swift
//  WGUtils
//
//  Created by Bence Pattogato on 18/02/16.
//  Copyright © 2016 Wintergarden. All rights reserved.
//

import UIKit

// Uncomment the lines below if you have installed Realm

//public class RLMModelWrapper: AnyObject {
//    var model: NSObject
//    
//    init(model: NSObject) {
//        self.model = model
//    }
//}
//
//extension RLMObject {
//    func wrap() -> RLMModelWrapper {
//        return RLMModelWrapper(model: self)
//    }
//}
//
//extension RLMRealm {
//    
//    func writeBlock(block: (() -> ())) {
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.beginWriteTransaction()
//            
//            block()
//            
//            do {
//                try self.commitWriteTransaction()
//            } catch {
//                return
//            }
//        })
//        
//    }
//    
//}
