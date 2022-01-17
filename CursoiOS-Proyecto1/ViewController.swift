//
//  ViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Miguel Santiago on 17/1/22.
//

import UIKit

class ViewController: UIViewController {
    private let fetchLandmarks: FetchLandmarksUseCase = FetchLandmarksFromDisk()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private var landmarks = [Landmark]()

}


private extension ViewController {
    func fetchData() {
        fetchLandmarks.fetchLandmarks { [weak self] result in
            switch result {
            case .success(let landmarks): self?.landmarks = landmarks
            case .failure(let error): fatalError(error.localizedDescription)
            }
        }
    }
}
