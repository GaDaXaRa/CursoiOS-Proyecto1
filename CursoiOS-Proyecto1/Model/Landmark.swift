//
//  Landmark.swift
//  CursoiOS-Proyecto1
//
//  Created by Miguel Santiago on 17/1/22.
//

import Foundation

enum LandmarkCategory: String, Codable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}

struct LandmarkCoordinate: Codable {
    let longitude: Double
    let latitude: Double
}

struct Landmark: Codable {
    let name: String
    let category: LandmarkCategory
    let city: String
    let state: String
    let id: Int
    let park: String
    let coordinates: LandmarkCoordinate
    let isFeatured: Bool
    let isFavorite: Bool
    let imageName: String
}

enum FetchLandmarksError: Error {
    case unableToFindFile, parseError(Error?)
}

protocol FetchLandmarksUseCase {
    func fetchLandmarks(_ completion: @escaping (Result<[Landmark], FetchLandmarksError>) -> ())
}

class FetchLandmarksFromDisk {
    private let bundle: Bundle
    private let resourceName: String
    
    init(bundle: Bundle = .main, resourceName: String = "landmarkData.json") {
        self.bundle = bundle
        self.resourceName = resourceName
    }
}

extension FetchLandmarksFromDisk: FetchLandmarksUseCase {
    func fetchLandmarks(_ completion: @escaping (Result<[Landmark], FetchLandmarksError>) -> ()) {
        guard let file = Bundle.main.url(forResource: resourceName, withExtension: nil) else {
            completion(.failure(.unableToFindFile))
            return
        }
        
        do {
            let data = try Data(contentsOf: file)
            let landmarks = try JSONDecoder().decode([Landmark].self, from: data)
            completion(.success(landmarks))
        } catch {
            completion(.failure(.parseError(error)))
        }
    }
}
