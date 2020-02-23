//
//  Container.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import UIKit

class Container {
    class func getHomeScreen() -> UIViewController {
        if let homeViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(
                withIdentifier: MoviesListViewController.identifier) as? MoviesListViewController {
            let navigationController = UINavigationController(rootViewController: homeViewController)
            return navigationController
        }
        return UIViewController()
    }
}
