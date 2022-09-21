//
//  ViewController.swift
//  MovieApp
//
//  Created by 조주은 on 2022/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    var movieModel: MovieModel?
    
    var term = ""
    
    var networkLayer = NetworkLayer()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        
        requestMovieAPI()
    }
    
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        networkLayer.request(type: .justURL(urlString: urlString)) { data, response, error in
            if let hasData = data {
                completion(UIImage(data: hasData))
                return
            }
            completion(nil)
        }
    }
    
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        if let hasURL = URL(string: urlString) {
//            var request = URLRequest(url: hasURL)
//            request.httpMethod = "GET"
//
//            session.dataTask(with: request) { data, response, error in
//                print((response as! HTTPURLResponse).statusCode)   // statusCode 꼭 알아두기
//                if let hasData = data {
//                    completion(UIImage(data: hasData))
//                    return
//                }
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//
//        completion(nil)
//    }
    
    
    // network
    func requestMovieAPI() {
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        let querys = [term, media]
        
        networkLayer.request(type: .searchMovie(querys: querys)) { data, response, error in
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)

                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }

                } catch {
                    print(error)
                }
            }
        }
    }
    
//    func requestMovieAPI() {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        var components = URLComponents(string: "https://itunes.apple.com/search")
//
//        let term = URLQueryItem(name: "term", value: term)
//        let media = URLQueryItem(name: "media", value: "movie")
//
//        components?.queryItems = [term, media]
//
//        guard let url = components?.url else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request) { data, response, error in
//            print((response as! HTTPURLResponse).statusCode)   // statusCode 꼭 알아두기
//
//
//            if let hasData = data {
//
//                do {
//                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
//
//                    print(self.movieModel ?? "no data")
//
//                    DispatchQueue.main.async {
//                        self.movieTableView.reloadData()
//                    }
//
//                } catch {
//                    print(error)
//                }
//            }
//        }
//
//        task.resume()
//        session.finishTasksAndInvalidate()
//
//    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
        self.present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        
        cell.priceLabel.text = currency + price
        
        if let hasURL = self.movieModel?.results[indexPath.row].image {
            self.loadImage(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    cell.movieImageView.image = image
                }
            }
        }
        
        
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate{
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        }
        
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        term = hasText
        requestMovieAPI()
        self.view.endEditing(true)
    }
}

