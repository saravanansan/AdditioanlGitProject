//
//  iOS_CL_Cus_SelectBrandVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_SelectBrandVC: UIViewController {
    
    
    @IBOutlet weak var brandCVC: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewSetUp()
    }

    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension iOS_CL_Cus_SelectBrandVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iOS_CL_Cus_SelectBrandCVC.identifier, for: indexPath) as? iOS_CL_Cus_SelectBrandCVC else{
            fatalError("Error in iOS_CL_Cus_SelectBrandCVC")
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.switchPage(indexValue: indexPath.item)
    }
}


extension iOS_CL_Cus_SelectBrandVC{
    private func collectionViewSetUp(){
        self.brandCVC.delegate = self
        self.brandCVC.dataSource = self
        self.brandCVC.register(iOS_CL_Cus_SelectBrandCVC.nib(), forCellWithReuseIdentifier: iOS_CL_Cus_SelectBrandCVC.identifier)
        self.categoryCVConfigure()
    }
    
    
    private func categoryCVConfigure() {
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 10
        let totalSpacing = (spacing * (numberOfItemsPerRow - 1)) + self.brandCVC.contentInset.left + self.brandCVC.contentInset.right
        let itemWidth = (self.brandCVC.bounds.width - totalSpacing) / numberOfItemsPerRow

        flowLayout.itemSize = CGSize(width: itemWidth, height: 190)
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing

        self.brandCVC.collectionViewLayout = flowLayout
        self.brandCVC.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    private func switchPage(indexValue: Int){
        let vc = iOS_CL_Cus_BrandDetailListingVC()
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
}



