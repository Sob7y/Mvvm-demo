//
//  MoviesListViewController.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet private weak var moviesTableView: UITableView!
    var refreshControl: UIRefreshControl?
    
    var isLoadingData = false
    var spinner: UIActivityIndicatorView!

    let dataSource = MoviesDataSource()
    
    lazy var viewModel: MoviesViewModel = {
        let viewModel = MoviesViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRefreshControl()
        setupNavigationController()
        registerCell()
        setupDataSource()
        fetchMovies()
    }
}

// MARK: - Private Funtions
extension MoviesListViewController {
    private func setupNavigationController() {
        self.title = "Movies Title"
    }
    
    private func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(resetToFirstPage), for: UIControl.Event.valueChanged)
        moviesTableView.refreshControl = refreshControl
    }
    
    private func registerCell() {
        self.moviesTableView.register(
            UINib(nibName: MovieTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    private func setupDataSource() {
        self.moviesTableView.dataSource = dataSource
        self.dataSource.data.addAndNotify(observer: self) { (movies) in
            self.isLoadingData = !movies.isEmpty ? false : true
            self.moviesTableView.reloadData()
            self.refreshControl?.endRefreshing()
            self.moviesTableView.tableFooterView = nil
        }
    }
    
    private func fetchMovies() {
        self.viewModel.fetchMovies()
    }
    
    private func loadMoreMovies() {
        self.viewModel.loadNextPage()
    }
    
    @objc
    private func resetToFirstPage() {
        self.viewModel.resetToFirstPage()
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.dataSource.data.value.count - 1
        if !isLoadingData && indexPath.row == lastElement {
            spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            spinner.frame = CGRect(x: CGFloat(0),
                                   y: CGFloat(0),
                                   width: self.moviesTableView.bounds.width,
                                   height: CGFloat(44))
            spinner.hidesWhenStopped = false
            spinner.startAnimating()
            tableView.tableFooterView = spinner
            
            isLoadingData = true
            loadMoreMovies()
        }
    }
}
