//
//  DetailController.swift
//  Simpsons Character Viewer
//
//  Created by Tadreik Campbell on 6/13/23.
//

import UIKit

final class DetailController: UIViewController {
    
    var cast: RelatedTopic?
    
    var placeholderImage = UIImage(systemName: "questionmark") ?? UIImage()
    
    lazy var textView: UITextView = {
        let v = UITextView(frame: .zero)
        v.font = .systemFont(ofSize: 20)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var imageView: UIImageView = {
        let v = UIImageView(image: placeholderImage)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private var imageOperation: BlockOperation?
    
    init(title: String, cast: RelatedTopic?) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.cast = cast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        imageOperation?.cancel()
    }
    
    func setupUI() {
        if let urlstring = cast?.icon?.url, let url = URL(string: urlstring) {
            setupImageDownloadOperation(url: url)
        }
        view.backgroundColor = .white
        textView.text = cast?.text ?? ""
        view.addSubviews(imageView, textView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupImageDownloadOperation(url: URL) {
        imageOperation?.cancel()
        imageOperation = BlockOperation()
        imageOperation?.qualityOfService = .utility
        imageOperation?.addExecutionBlock { [weak self] in
            guard let self else { return }
            self.downloadImage(url: url) { image in
                if let image {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
        imageOperation?.start()
    }
    
    func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
    
}
