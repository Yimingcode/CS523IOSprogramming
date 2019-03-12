//
//  ImageViewController.swift
//  Images
//
//  Created by Terence on 10/8/16.
//  Copyright © 2016 Yongxin (Terence) Feng. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    private var imageView = UIImageView()
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage();
            }
        }
    }
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private func fetchImage() {
        if let url = imageURL {
            loadingIndicator.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                guard let imageData = NSData(contentsOf: url) else {
                    self.loadingIndicator.stopAnimating()
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData as Data)
                    self.loadingIndicator.stopAnimating()
                }
            }
        }
    }
    
}
