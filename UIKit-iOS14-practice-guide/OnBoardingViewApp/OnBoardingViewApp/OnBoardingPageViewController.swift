//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by 조주은 on 2022/09/18.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currentIndex = 0 {
        // 값을 받을 때마다 didSet 호출
        didSet {
            self.pageControl.currentPage = currentIndex
        }
    }
    
    func makePageVC() {
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        
        // 화면이 생성되는 시간 때문에 @IBOutlet으로 연결된 객체 nil로 뜸
        // itemVC1.mainTitleLabel = "첫번째"
        
        itemVC1.mainText = "첫번째"
        itemVC1.topImage = UIImage(systemName: "person")
        itemVC1.subText = "한명이지롱"
        
        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "두번째"
        itemVC2.topImage = UIImage(systemName: "person.2")
        itemVC2.subText = "두명이지롱"
        
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "세번째"
        itemVC3.topImage = UIImage(systemName: "person.3")
        itemVC3.subText = "세명이지롱"
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        // 보여지는 viewcontroller 세팅
        setViewControllers([itemVC1], direction: .forward, animated: true)
        
        self.dataSource = self
        self.delegate = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        
        self.makeBottomButton()
        
        self.makePageControl()
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didmissPageVC), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃을 하기 위한 설정
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
        
        hideButton()
    }
    
    @objc func didmissPageVC() {
        self.dismiss(animated: true)
    }
    
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        
        self.currentIndex = sender.currentPage
        
        self.buttonPresentationStyle()
        
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        
        self.currentIndex = currentIndex
        
        self.buttonPresentationStyle()
    }
    
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1 {
            self.showButton()
        } else {
            self.hideButton()
        }
        
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25, delay: 0,options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
