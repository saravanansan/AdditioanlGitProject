//
//  iOS_CL_MySchemesVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import UIKit

class iOS_CL_MySchemesVC: UIViewController, ScheemsVM_OutputProtocol {
    
    @IBOutlet weak var scheemsCV: UICollectionView!
    
    var viewModel : ScheemsVM_InputProtocol
    
    init(viewModel: ScheemsVM_InputProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryCVConfigure()
    }


    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


extension iOS_CL_MySchemesVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iOS_CL_MySchemesCVC.identifier, for: indexPath) as? iOS_CL_MySchemesCVC else{
            fatalError("Error in iOS_CL_MySchemesCVC")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.switchPage(indexValue: indexPath.item)
    }
}


extension iOS_CL_MySchemesVC{
    private func collectionViewConfiguration(){
        self.scheemsCV.register(iOS_CL_MySchemesCVC.nib(), forCellWithReuseIdentifier: iOS_CL_MySchemesCVC.identifier)
        self.scheemsCV.delegate = self
        self.scheemsCV.dataSource = self
    }
    
    private func categoryCVConfigure() {
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 10
        let totalSpacing = (spacing * (numberOfItemsPerRow - 1)) + self.scheemsCV.contentInset.left + self.scheemsCV.contentInset.right
        let itemWidth = (self.scheemsCV.bounds.width - totalSpacing) / numberOfItemsPerRow
        flowLayout.itemSize = CGSize(width: itemWidth, height: 190)
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
        self.scheemsCV.collectionViewLayout = flowLayout
        self.scheemsCV.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionViewConfiguration()
    }
    
    private func switchPage(indexValue: Int){
        let vc = iOS_CL_Cus_MySchemesDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
}
