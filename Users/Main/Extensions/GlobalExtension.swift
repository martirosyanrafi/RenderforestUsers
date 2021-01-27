//
//  GlobalExtension.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import UIKit

func getController<T: UIViewController>() -> T {
    return T(nibName: String(describing: T.self), bundle: nil)
}
