//
//  ViewController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 16/12/22.
//

import UIKit
import SwiftUI
import OSLog


class AMPageControl: UIPageControl {
//
//    var dotViews: [UIView] = [UIView]()
//
//    let spacing: CGFloat = 10
//    let width: CGFloat = 25
//    let height: CGFloat = 10
//
//
//    override var currentPage: Int{
//        didSet{
//
//            if dotViews.isEmpty == false {
//                animateViews(from: oldValue, to: currentPage)
//            }
//        }
//    }
//
//    private var currentIndexColour: UIColor {
//        return .purple
//    }
//
//    private var normalIndexColour: UIColor {
//        return .orange
//    }
//
//
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        guard !subviews.isEmpty else { return }
//
//        var total: CGFloat = 0
//
//
//        if dotViews.isEmpty {
//            for index in 0..<numberOfPages {
//
//                let dotView = UIView()
//                let isCurrentIndex = (index == currentPage)
//                dotView.backgroundColor = isCurrentIndex ? currentIndexColour : normalIndexColour
//                dotView.layer.cornerRadius = 5
//                dotView.frame = CGRect(x: total, y: frame.size.height / 2 - height / 2, width: isCurrentIndex ? width : height, height: height)
//                total += width + spacing
//                self.addSubview(dotView)
//                dotViews.append(dotView)
//
//            }
////            total -= spacing
////            frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
////            frame.size.width = total
//        }
//
//    }
//
//    private func animateViews(from fromIndex: Int, to toIndex: Int){
//        UIView.animate(withDuration: 0.2, animations: {
//
//            let firstView = self.dotViews[fromIndex]
//            let secondView = self.dotViews[toIndex]
//
//            firstView.frame.size.width = self.height
//            firstView.backgroundColor = self.normalIndexColour
//            secondView.frame.size.width = self.width
//            secondView.backgroundColor = self.currentIndexColour
//        })
//    }
}


class ListViewController: UIViewController {

    @IBOutlet weak var pageIndicator: AMPageControl!

    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    private var items: [MenuViewModel] = []
    private var cellControllers: [IndexPath : MenuCellController] = [:]

    let pageControlContentView = UIHostingController(rootView: PageControlView(currentPage: 0.0, pageCount: 5, tintColor: .green, normalColor: .orange))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        items = MenuViewModel.allItems
        tableView.reloadData()

        addChild(pageControlContentView)
        view.addSubview(pageControlContentView.view)

        pageControlContentView.view.translatesAutoresizingMaskIntoConstraints = false
        pageControlContentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pageControlContentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageControlContentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageControlContentView.view.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }


    @IBAction func selectSegment(_ sender: UISegmentedControl) {
        pageIndicator.currentPage = sender.selectedSegmentIndex
        pageControlContentView.rootView = PageControlView(currentPage: CGFloat(pageIndicator.currentPage), pageCount: 5, tintColor: .purple, normalColor: .pink)
    }



}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = items[indexPath.row]
        let cellController = MenuCellController(viewModel: cellViewModel)
        cellControllers[indexPath] = cellController
        return cellController.view(in: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("selected cell - \(indexPath.row)")


    }
}

extension ListViewController : DetailsViewControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destinationVC = segue.destination as! DetailsViewController
        destinationVC.delegate = self
    }

    func showAlert(message: String) {
        let alertVC = UIAlertController(title: "A good message for entire world", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            
        }))
        present(alertVC, animated: true, completion: nil)
    }

}
