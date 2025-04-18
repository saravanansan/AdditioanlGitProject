//
//  ImageDetailsViewVC.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 19/07/24.
//

import UIKit


protocol ImageDetailsDelegate{
    func imageDetailsDismiss()
}


class ImageDetailsViewVC: AppViewController {

    @IBOutlet weak var imageDetailsView: PinchZoomView!
    
    var imageName : String?
    var imgURL : URL?
    var isRotate = false
    
    var delegate: ImageDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageDetailsView.isRotate = isRotate
        imageDetailsView.imageURL = imgURL
        imageDetailsView.imageName = imageName
        
    }

    @IBAction func didTappedCloseBtn(_ sender: Any) {
        self.delegate?.imageDetailsDismiss()
        dismiss(animated: true)
    }

}
