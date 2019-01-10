//
//  AddWalletViewController.swift
//  DiveLane
//
//  Created by Anton Grigorev on 08/09/2018.
//  Copyright © 2018 Matter Inc. All rights reserved.
//

import UIKit

class AddWalletViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var matterWallet: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var importButton: BasicDeselectedButton!
    @IBOutlet weak var createButton: BasicSelectedButton!
    
    let isNavigationBarNeeded: Bool

    init(isNavigationBarNeeded: Bool = false) {
        self.isNavigationBarNeeded = isNavigationBarNeeded
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = Colors.firstMain
        matterWallet.textColor = Colors.secondMain
        subtitle.textColor = Colors.active
        importButton.setTitle("Import Wallet", for: .normal)
        createButton.setTitle("Create Wallet", for: .normal)
        matterWallet.text = "Matter Wallet"
        subtitle.text = "The First Ethereum Wallet with Plasma onboard"
        matterWallet.textAlignment = .center
        subtitle.textAlignment = .center
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = !isNavigationBarNeeded
    }

    @IBAction func importWallet(_ sender: UIButton) {
        let walletImportingViewController = WalletImportingViewController()
        self.navigationController?.pushViewController(walletImportingViewController, animated: true)
    }

    @IBAction func createWallet(_ sender: UIButton) {
        let walletCreationViewController = WalletCreationViewController()
        self.navigationController?.pushViewController(walletCreationViewController, animated: true)
    }

    @objc func alertControllerBackgroundTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}