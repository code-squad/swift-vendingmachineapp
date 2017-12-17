//
//  ManagerModePageViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 18..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ManagerModePageViewController: UIPageViewController {
    lazy var makeViewControllers: [UIViewController] = {
        return [viewControllerInitialize(name: "ManagerModeController")]
    }()
    private func viewControllerInitialize(name: String) -> UIViewController {
        return UIStoryboard(name: "ManagerMode", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let first = makeViewControllers.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension ManagerModePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = makeViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return makeViewControllers.last
        }
        guard makeViewControllers.count > previousIndex else {
            return nil
        }
        return makeViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = makeViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex - 1
        guard nextIndex < makeViewControllers.count else {
            return makeViewControllers.first
        }
        guard makeViewControllers.count > nextIndex else {
            return nil
        }
        return makeViewControllers[nextIndex]
    }


}

extension ManagerModePageViewController: UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return makeViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstviewController = viewControllers?.first,
            let firstViewControllerIndex = makeViewControllers.index(of: firstviewController) else {
            return 0
        }
        return firstViewControllerIndex
    }
}
