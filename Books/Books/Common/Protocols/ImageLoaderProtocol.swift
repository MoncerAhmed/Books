//
//  ImageLoaderProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Nuke
import Combine

//sourcery: AutoMockable
protocol ImageLoaderProtocol {
    func loadImage(
        url: URL,
        into: UIImageView,
        placeholder: UIImage?,
        completion: ((UIImage) -> Void)?)
    func image(for url: URL) -> AnyPublisher<UIImage, Error>
}

class ImageLoader: ImageLoaderProtocol {
    func image(for url: URL) -> AnyPublisher<UIImage, Error> {
        return Future { [pipeLine] promise in
            pipeLine.loadImage(with: url, queue: nil, progress: nil) { imageResult in
                switch imageResult {
                case .failure(let error):
                    promise(.failure(error))
                case .success(let response):
                    promise(.success(response.image))
                }

            }
        }
        .eraseToAnyPublisher()
    }

    private let pipeLine: ImagePipeline = ImagePipeline()

    func loadImage(
        url: URL,
        into: UIImageView,
        placeholder: UIImage? = nil,
        completion: ((UIImage) -> Void)? = nil) {
            into.image = placeholder
            pipeLine.loadImage(with: url, queue: nil, progress: nil) { [completion] result in
                switch result {
                case .success(let imageResponse):
                    into.image = imageResponse.image
                case .failure(let error):
                    print(error)
                }
                guard let image = into.image else { return }
                completion?(image)
            }
        }
}
