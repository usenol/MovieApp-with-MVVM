//
//  Observable.swift
//  MovieAppSonHal
//
//  Created by StajyerU on 7.07.2023.
//

import Foundation

//generic type olacak
//generic type her çeşit veriyi alabilir

class Observable<T> {
    
    var value: T? {
        //değer değiştiğinde burada bilgilendirileceğiz
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    //bir şeyi başka bir şeye bağladığımızda
    func bind(_ listener: @escaping ((T?) -> Void)){
        self.listener = listener
    }
}
