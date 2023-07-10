//
//  APIConstant.swift
//  MovieAppSonHal
//
//  Created by Umut Şenol on 7.07.2023.
//

import Foundation

class APIConstants {
    
    public static var shared: APIConstants = APIConstants()
    
    public var apiKey: String {
        get {
            //https://www.themoviedb.org/
            return "2726c76c6575381f695437d9319dec9e"
        }
    }
    
    public var serverAddress: String {
        get {
            return "http://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "http://image.tmdb.org/t/p/w500/"
        }
    }
}
