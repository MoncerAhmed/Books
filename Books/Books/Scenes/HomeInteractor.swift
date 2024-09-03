//
//  HomeInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit
import Combine

protocol HomeInteractorProtocol {
    func handleViewDidLoad()
}

class HomeInteractor: HomeInteractorProtocol {
    private var presenter: HomePresenterProtocol?

    private var anyCancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }

    func handleViewDidLoad() {
       // TODO: make API call to retrieve books
    }
}
