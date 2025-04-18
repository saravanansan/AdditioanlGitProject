//
//  PinchZoomView.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 19/07/24.
//

import Foundation
import UIKit
import SDWebImage

class PinchZoomView: UIScrollView {

    @IBInspectable
    var imageName: String? {
        didSet {
            guard let imageName = imageName else {
                return
            }
            imageView.image = UIImage(named: imageName)
            if self.isRotate{
                guard self.imageView.image != nil else{
                    return
                }
                self.imageView.image = self.rotateImage90Degrees(image: self.imageView.image!)
            }
        }
    }
    var isRotate = false
    
    func rotateImage90Degrees(image: UIImage) -> UIImage {
        let rotatedImage = UIImage(cgImage: image.cgImage!, scale: 1.0, orientation: .right)
        return rotatedImage
    }
    
    var imageURL: URL? {
        didSet {
            guard let imageURL = imageURL else {
                return
            }
            imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "appLogo")){_,_,_,_ in
                if self.isRotate{
                    guard self.imageView.image != nil else{
                        return
                    }
                    self.imageView.image = self.rotateImage90Degrees(image: self.imageView.image!)
//                    commonInit()
                }
            }
        }
    }
    
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    convenience init(named: String) {
        self.init(frame: .zero)
        self.imageName = named
    }

    private func commonInit() {
        // Setup image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        // Setup scroll view
        minimumZoomScale = 1
        maximumZoomScale = 3
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        
        // Setup tap gesture
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapRecognizer)
    }

    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if zoomScale == 1 {
            setZoomScale(2, animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
    
}

extension PinchZoomView: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
