//
//  HomeVC.swift
//  IDEHospital
//
//  Created by Ziad on 08/12/2020.
//

import UIKit

protocol HomeVCProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func reloadCollectionView()
    func goToTabBar(with id: Int)
    func goToHomeNurse()
}

class HomeVC: UIViewController {
    //MARK:- Properties
    private var viewModel: HomeViewModelProtocol!
    
    //MARK:- IBOutlets
    @IBOutlet weak var homeView: HomeView!
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel(view: self)
        homeView.setup()
        viewModel.mainCategoriesData()
        setupNavController(title: L10n.chooseServices)
        setupCollectionView()
    }
    
    //MARK:- Public Methods
    class func create() -> HomeVC {
        let homeVC: HomeVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.homeVC)
        homeVC.viewModel = HomeViewModel(view: homeVC)
        return homeVC
    }
}

//MARK:- Private Methods
extension HomeVC {
    private func setupCollectionView() {
        homeView.collectionView.register(UINib.init(nibName: Cells.categoryCell, bundle: nil), forCellWithReuseIdentifier: Cells.categoryCell)
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
}

//MARK:- HomeVC Protocol
extension HomeVC: HomeVCProtocol {
    func showLoader() {
        self.view.showActivityIndicator()
    }
    
    func hideLoader() {
        self.view.hideActivityIndicator()
    }
    
    func reloadCollectionView() {
        self.homeView.collectionView.reloadData()
    }
    
    func goToTabBar(with id: Int) {
        let tabBarVC = MainTabBar.create(with: id)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    func goToHomeNurse() {
        let homeNurseVC = HomeNurseContactUsVC.create(status: .homeNurse)
        homeNurseVC.setupNavigationItems(backAction: .popUpCurrent)
        navigationController?.pushViewController(homeNurseVC, animated: true)
    }
}

//MARK:- CollectionView Data Source
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.categoryCell, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        cell.configure(viewModel.getCategoryData(for: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.didSelectItem(item: indexPath.row)
    }
}
