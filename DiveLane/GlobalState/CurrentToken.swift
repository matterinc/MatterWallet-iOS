//
//  CurrentToken.swift
//  DiveLane
//
//  Created by Anton Grigorev on 08/09/2018.
//  Copyright © 2018 Matter Inc. All rights reserved.
//

import Foundation

public class CurrentToken: ERC20Token {

    private static var _currentToken: ERC20Token?
    private static let tokensService = TokensService()

    public class var currentToken: ERC20Token? {
        get {
            if let token = _currentToken {
                return token
            }
            let etherToken = Ether()
            do {
                guard let wallet = CurrentWallet.currentWallet else {
                    fatalError("Can't select wallet")
                }
                try etherToken.select(in: wallet)
                _currentToken = etherToken
                return etherToken
            } catch let error {
                fatalError("Can't select token \(etherToken.name), error: \(error.localizedDescription)")
            }
        }
        set(token) {
            if let token = token {
                do {
                    guard let wallet = CurrentWallet.currentWallet else {
                        fatalError("Can't select wallet")
                    }
                    try token.select(in: wallet)
                    _currentToken = token
                } catch let error {
                    fatalError("Can't select token \(token.address), error: \(error.localizedDescription)")
                }
            }
        }
    }

}
