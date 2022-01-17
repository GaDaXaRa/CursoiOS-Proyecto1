//
//  ViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Miguel Santiago on 17/1/22.
//

import UIKit

class ViewController: UIViewController {
    private let fetchLandmarks: FetchLandmarksUseCase = FetchLandmarksFromDisk()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("did appeaer")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("will layout subviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("did layout subviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will dissappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did dissappear")
    }

    private var landmarks = [Landmark]()

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "landmarkCell", for: indexPath)
        let model = landmarks[indexPath.row]
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.park
        cell.imageView?.image = model.image
        
        return cell
    }
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
