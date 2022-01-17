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
        tableView.register(.init(nibName: "LandmarkTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "LandmarkTableViewCell")
        navigationItem.title = "Landmarks"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushFromCell", let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell), let viewController = segue.destination as? DetailViewController {
            let model = landmarks[indexPath.row]
            viewController.viewModel = model.toDetailViewModel
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "pushFromCell", sender: cell)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandmarkTableViewCell", for: indexPath) as? LandmarkTableViewCell else {
            fatalError()
        }
        
        let model = landmarks[indexPath.row]
        cell.configure(with: model.toTableCellViewModel)
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
