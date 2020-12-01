//
//  CartViewController.swift
//  Delicatessen
//
//  Created by Bertrand BLOC'H on 25/11/2020.
//  Copyright © 2020 Chimere.io LTD. All rights reserved.
//

import UIKit
import DLCommons
import RxSwift
import RxCocoa

final class CartViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: CartViewModel
    private let disposeBag = DisposeBag()

    private let viewIsLoaded = PublishSubject<Void>()

    private let tableView = UITableView()

    // MARK: - Init

    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
    }

    private func bindViewModel() {
        rx.viewIsLoaded
            .bind(to: viewIsLoaded)
            .disposed(by: disposeBag)

        let inputs = CartViewModel.Inputs(viewIsLoaded: viewIsLoaded)

        let outputs = viewModel.transform(inputs: inputs)

        outputs
            .title
            .asDriver(onErrorJustReturn: "Test")
            .drive(onNext: { [weak self] title in
                self?.title = title
            })
            .disposed(by: disposeBag)
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.makeLayout {
            $0.fillSuperview()
        }
    }
}

public extension Reactive where Base: UIViewController {

    var viewIsLoaded: Observable<Void> {
        return base.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid().take(1)
    }

    var viewWillAppear: Observable<Void> {
        return base.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid()
    }

    var viewDidAppear: Observable<Void> {
        return base.rx.sentMessage(#selector(UIViewController.viewDidAppear(_:))).mapToVoid()
    }

    var viewDidLayoutSubviews: Observable<Void> {
        return base.rx.sentMessage(#selector(UIViewController.viewDidLayoutSubviews)).mapToVoid()
    }
}

public extension ObservableType {

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }

    func mapToOptional() -> Observable<Element?> {
        return self.map({
            $0 as Element?
        })
    }

    func startWithSkipInitial(_ element: Element) -> Observable<Element> {
        return skip(1).startWith(element)
    }
}
