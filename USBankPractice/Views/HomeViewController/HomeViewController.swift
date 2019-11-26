//
//  ViewController.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 11/09/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- IBOutlets
    //MARK:-
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CommonTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.reusableIdentifier)
        }
    }
    
    @IBOutlet weak var viewForTable: UIView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var panViewBottomConstraint: NSLayoutConstraint!
    
    //MARK:- Properties
    //MARK:- Private
    private(set) var viewModel = HomeViewModel()
    private let bottomSheetHeightClosed: CGFloat = 59.0
    private var bottomSheetHeightOpen: CGFloat {
        return tableView.frame.height
    }
    private(set) var detailsVC: DetailsViewController?
    private var isBottomSheetClosed: Bool {
        return (viewForTable.frame.height == bottomSheetHeightClosed)
    }
    
    //MARK:- View Controller Life Cycle
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchHomeData()
        setupNavigation()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupAndUpdatePanView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppNavigationManager.default.mainNavigationController.isNavigationBarHidden = false
    }
    
    //MARK:- Methods
    //MARK:- Private
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(self.rightButtonAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(self.leftButtonAction))
    }
    
    private func bindViewModel() {
        viewModel.delegate = self
    }
    
    private func setupAndUpdatePanView() {
        func update(detailView: UIView) {
            view.layoutIfNeeded()
        }
        
        if let detailsVC = detailsVC {
            update(detailView: detailsVC.view)
        }
        else {
            
            let dlsVC = DetailsViewController.instantiate(fromAppStoryboard: .Main)
            addChild(dlsVC)
            viewForTable.addSubview(dlsVC.view)
            viewForTable.translatesAutoresizingMaskIntoConstraints = false
            detailsVC = dlsVC
            let detailView = dlsVC.view!
            
            let leadingConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 59)
            let bottomConstraint = NSLayoutConstraint(item: detailView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewForTable, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            viewForTable.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            
            update(detailView: dlsVC.view)
        }
    }

    private func hideBottomSheet(isHidden: Bool, animated: Bool) {
        
        viewHeightConstraint.constant = isHidden ? bottomSheetHeightClosed : bottomSheetHeightOpen

        if animated {
            let animator = UIViewPropertyAnimator(duration: AppConstant.animationDuration, curve: .linear) {[weak self] in
                
                guard let `self` = self else {
                    return
                }
                
                self.view.layoutIfNeeded()
            }
            animator.startAnimation()
        }
        else {
            view.layoutIfNeeded()
        }
    }
    
    //MARK:- Actions
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        hideBottomSheet(isHidden: !isBottomSheetClosed, animated: true)
    }
    
    @objc func rightButtonAction () {
        printDebug("Hi")
    }
    
    @objc func leftButtonAction () {
        //logout
        AppUserDefaults.removeValue(forKey: .isSignin)
        AppNavigationManager.default.setupInitialFlow()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.reusableIdentifier, for: indexPath) as! CommonTableViewCell
        
        if let data = viewModel.allTransaction {
            if (indexPath.section == 0 && !data.checking.isEmpty) {
                cell.configureData(transection: data.checking[indexPath.row])
            }
            else {
                cell.configureData(transection: data.investment[indexPath.row])
            }
        }
        
        return cell
    }
}

//MARK:- ViewModel delegate methods
//MARK:-
extension HomeViewController: HomeViewModelDelegate {
    func fetchHomeDataSuccess() {
        tableView.reloadData()
    }
    
    func fetchHomeDataFail() {
        //handel for failed case
    }
}
