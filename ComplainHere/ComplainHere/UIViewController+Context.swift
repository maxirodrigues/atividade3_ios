//
//  UIViewController+Context.swift
//  ComplainHere
//
//  Created by User on 04/01/2022.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentController.viewContext
    }
}
