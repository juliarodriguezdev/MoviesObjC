//
//  JJRTableViewController.swift
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class JJRTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movie: [JJRMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movie.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? JJRTableViewCell else { return UITableViewCell()}

        let movieItem = movie[indexPath.row]

        cell.titleLabel.text = movieItem.title
        cell.ratingLabel.text = "Rating: \(movieItem.rating)"
        cell.overViewLabel.text = movieItem.overview
        
    
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JJRTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // unwrap user movie search term
        guard let movieSearchInput = searchBar.text, movieSearchInput != "" else { return }
        
        JJRMovieController.fetchMovies(movieSearchInput) { (movie) in
            if let unwrappedMovie = movie {
                self.movie = unwrappedMovie
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
}
