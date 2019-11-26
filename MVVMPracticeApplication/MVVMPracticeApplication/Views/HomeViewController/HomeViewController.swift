//
//  ViewController.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 11/09/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- IBOutlets
    //MARK:-
    @IBOutlet weak var firsttableView: UITableView! {
        didSet {
            firsttableView.register(UINib(nibName: CommonTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.reusableIdentifier)
        }
    }
    
    @IBOutlet weak var viewForTable: UIView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var panViewBottomConstraint: NSLayoutConstraint!
    
    //MARK:- Properties
    //MARK:- Private
    private(set) var viewModel = HomeViewModel()
    
    //MARK:- View Controller Life Cycle
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchHomeData()
        navigation()
        setupPanView()
        bindViewModel()
        //self.view.layoutIfNeeded()
    }
    
    func navigation() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(navigateButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(navigateButtonTapped))
    }
    
    private func bindViewModel() {
        self.viewModel.delegate = self
    }
    
    private func setupPanView() {
        if let detailsVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController, let detailView = detailsVC.view {
            self.addChild(detailsVC)
            viewForTable.addSubview(detailsVC.view)
            viewForTable.translatesAutoresizingMaskIntoConstraints = false
            let leadingConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 59)
            let bottomConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            viewForTable.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK:- Actions
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if(viewForTable.frame.height == 59){
            self.viewHeightConstraint.constant = firsttableView.frame.height + 59
        }
        else{
            self.viewHeightConstraint.constant =  59
        }

//        UIView.animate(withDuration: 0.5, animations: {
//            self.view.layoutIfNeeded()
//        })
    }
    
    @objc func navigateButtonTapped () {
        printDebug("Hi")
    }
}

//MARK:- Extension for table view data source and delegate methods
//MARK:-
extension HomeViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = viewModel.allTransaction else {
            return 0
        }
        
        return (section == 0 && !data.checking.isEmpty) ? data.checking.count : data.investment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = firsttableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.reusableIdentifier, for: indexPath) as! CommonTableViewCell
        return cell
    }
}

//MARK:- ViewModel delegate methods
//MARK:-
extension HomeViewController: HomeViewModelDelegate {
    func fetchHomeDataSuccess() {
        firsttableView.reloadData()
    }
    
    func fetchHomeDataFail() {
        //handel for failed case
    }
}
