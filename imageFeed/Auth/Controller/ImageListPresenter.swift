//
//  ImageListPresenter.swift
//  ImageFeed
//
//  Created by Yerman Ibragimuly on 24.09.2024.
//

import Foundation

public protocol ImagesListPresenterProtocol {
    var view: ImagesListViewControllerProtocol? { get set }
}

final class ImagesListPresenter {
    weak var view: ImagesListViewControllerProtocol?
}

extension ImagesListPresenter: ImagesListPresenterProtocol {

}
