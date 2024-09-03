//
//  RootNavigatorProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

//sourcery: AutoMockable
protocol RootNavigatorProtocol: AnyObject {
    func setRootNavigator()
}

class RootNavigator: RootNavigatorProtocol {
    private var application: UIApplicationProtocol
    private let homeStoryboard: Storyboard

    init(application: UIApplicationProtocol,
         homeStoryboard: Storyboard) {
        self.application = application
        self.homeStoryboard = homeStoryboard
    }

    func setRootNavigator() {
        application.rootViewController = homeStoryboard.initial()
    }
}
