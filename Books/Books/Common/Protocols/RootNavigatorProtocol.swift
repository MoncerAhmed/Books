//
//  RootNavigatorProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

//sourcery: AutoMockable
protocol RootNavigatorProtocol: AnyObject {
    func setRootNavigator()
    func setTabBarAsRoot()
}

class RootNavigator: RootNavigatorProtocol {
    private var application: UIApplicationProtocol
    private let tabBarStoryboard: Storyboard


    init(application: UIApplicationProtocol,
         tabBarStoryboard: Storyboard
    ) {
        self.application = application
        self.tabBarStoryboard = tabBarStoryboard
    }

    func setRootNavigator() {
        setTabBarAsRoot()
    }

    func setTabBarAsRoot() {
        application.rootViewController = tabBarStoryboard.initial()
    }

}
