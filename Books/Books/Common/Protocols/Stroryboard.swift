//
//  Stroryboard.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation
import Swinject

//sourcery: AutoMockable
protocol StoryboardId {
    var identifier: String { get }
}

//sourcery: AutoMockable
protocol Storyboard {
    func initial<T: UIViewController>() -> T?
    func viewController<T: UIViewController>(identifier: StoryboardId) -> T?
}
