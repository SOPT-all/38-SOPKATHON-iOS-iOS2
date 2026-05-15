//
//  ViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/15/26.
//

import UIKit

class ViewController: BaseViewController {

    private let testView = TestView()
    
    override func loadView() {
        view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }


}

