//
//  MainViewModel.swift
//  MovieAppSonHal
//
//  Created by StajyerU on 7.07.2023.
//

import Foundation

class MainViewModel{
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: PopularMovieModel?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int{
        self.dataSource?.results.count ?? 0
        
    }
    
    func getData(){
        if isLoadingData.value ?? true{ //çift soru işareti, optional değişken olduğu için güvenli açmak için
            return
        }
        isLoadingData.value = true // bu yükleme işleminin tamam olduğu anlamına gelir
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoadingData.value = false //burada durur
            
            switch result{
                
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapCellData()
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results.self.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String{
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
