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
    private var networkObserver: NetworkObserverProtocol

    private var anyCancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    init(presenter: HomePresenterProtocol,
         networkObserver: NetworkObserverProtocol) {
        self.presenter = presenter
        self.networkObserver = networkObserver
    }

    func handleViewDidLoad() {
        networkObserver.statePublisher.sink {[weak self] state in
            self?.handleState(state)
        }
        .store(in: &anyCancellables)
    }

    private func handleState(_ connected: Bool) {
        presenter?.presentNoInternet(connected: connected)
    }
}
