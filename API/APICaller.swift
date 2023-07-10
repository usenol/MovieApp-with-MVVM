//
//  APICaller.swift
//  MovieAppSonHal
//
//  Created by Umut Şenol on 7.07.2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<PopularMovieModel, NetworkError>) -> Void) {
        if APIConstants.shared.apiKey.isEmpty {
            print("API KEY is Missing ")
            return
        }
        
        let urlString = APIConstants.shared.serverAddress +
                "trending/all/day?api_key=" +
                APIConstants.shared.apiKey
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(PopularMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
