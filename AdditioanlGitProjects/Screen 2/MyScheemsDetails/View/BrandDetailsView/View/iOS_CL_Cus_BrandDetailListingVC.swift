//
//  iOS_CL_Cus_BrandDetailListingVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_Cus_BrandDetailListingVC: UIViewController {

    @IBOutlet weak var headingNameLbl: UILabel!
    @IBOutlet weak var brandNameLbl: UILabel!
    @IBOutlet weak var subCategoryNameLbl: UILabel!
    @IBOutlet weak var searchProductTF: UITextField!
    @IBOutlet weak var brandListingCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewSetup()
    }
    
    
    @IBAction func subCategoryBtn(_ sender: Any) {
    }
    
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension iOS_CL_Cus_BrandDetailListingVC{
    private func collectionViewSetup(){
        self.brandListingCV.delegate = self
        self.brandListingCV.dataSource = self
        self.brandListingCV.register(iOS_CL_Cus_BrandListCVC.nib(), forCellWithReuseIdentifier: iOS_CL_Cus_BrandListCVC.identifier)
        self.categoryCVConfigure()
    }
    
    private func categoryCVConfigure() {
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 10
        let totalSpacing = (spacing * (numberOfItemsPerRow - 1)) + self.brandListingCV.contentInset.left + self.brandListingCV.contentInset.right
        let itemWidth = (self.brandListingCV.bounds.width - totalSpacing) / numberOfItemsPerRow
        flowLayout.itemSize = CGSize(width: itemWidth, height: 190)
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
        self.brandListingCV.collectionViewLayout = flowLayout
        self.brandListingCV.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    private func switchPage(indexValue: Int){
        let vc = iOS_CL_Cus_OrderCarVC()
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
}

extension iOS_CL_Cus_BrandDetailListingVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iOS_CL_Cus_BrandListCVC.identifier, for: indexPath) as? iOS_CL_Cus_BrandListCVC else{
            fatalError("Error on iOS_CL_Cus_BrandListCVC")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.switchPage(indexValue: indexPath.item)
    }
}
