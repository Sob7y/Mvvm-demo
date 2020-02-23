//
//  MoviesDataSource.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import UIKit

class MoviesDataSource: GenericDataSource<MoviesModel>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.identifier,
            for: indexPath) as? MovieTableViewCell
            else { return UITableViewCell() }
        
        cell.movieModel = data.value[indexPath.row]
        
        cell.selectionStyle = .none
        return cell
    }
}
