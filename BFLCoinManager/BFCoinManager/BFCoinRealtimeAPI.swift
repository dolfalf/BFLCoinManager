//
//  BFCoinRealtimeAPI.swift
//  BFLCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation
import PubNub

enum PrefixChannel : String {
    case market         = "lightning_board_snapshot_"
    case board          = "lightning_board_"
    case ticker         = "lightning_ticker_"
    case executions     = "lightning_executions_"
}

final class BFCoinRealtimeAPI : NSObject {
    
    internal var client: PubNub!
    
    init(_ client: PubNub) {
        super.init()
        self.client = client
    }
    
    static func setupClient() -> PubNub {
        
        let configuration = PNConfiguration(publishKey: "BFCoinMgr", subscribeKey: "sub-c-52a9ab50-291b-11e5-baaa-0619f8945a4f")
        configuration.stripMobilePayload = false
        return PubNub.clientWithConfiguration(configuration)
    }
    
    //MARK: Channel
    func registChannelsAll(_ productCode: String) {
        
        self.registMarketChannel(productCode)
        self.registBoardChannel(productCode)
        self.registTickerChannel(productCode)
        self.registExecutionsChannel(productCode)
    }
    
    func releaseChannelsAll() {
        self.client.unsubscribeFromAll()
    }
    
    func registMarketChannel(_ productCode: String) {
        
        //let subscribeKey = "\(PrefixChannel.market.rawValue)\(productCode)"
        let subscribeKey = "lightning_ticker_BTC_JPY"
        self.client.subscribeToChannels([subscribeKey], withPresence: true)
    }
    
    func releaseMarketChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.market.rawValue)\(productCode)"
        self.client.unsubscribeFromChannels([subscribeKey], withPresence: true)
    }
    
    func registBoardChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.board.rawValue)\(productCode)"
        self.client.subscribeToChannels([subscribeKey], withPresence: true)
    }
    
    func releaseBoardChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.board.rawValue)\(productCode)"
        self.client.unsubscribeFromChannels([subscribeKey], withPresence: true)
    }
    
    func registTickerChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.ticker.rawValue)\(productCode)"
        self.client.subscribeToChannels([subscribeKey], withPresence: true)
    }
    
    func releaseTickerChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.ticker.rawValue)\(productCode)"
        self.client.unsubscribeFromChannels([subscribeKey], withPresence: true)
    }
    
    func registExecutionsChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.executions.rawValue)\(productCode)"
        self.client.subscribeToChannels([subscribeKey], withPresence: true)
    }
    
    func releaseExecutionsChannel(_ productCode: String) {
        
        let subscribeKey = "\(PrefixChannel.executions.rawValue)\(productCode)"
        self.client.unsubscribeFromChannels([subscribeKey], withPresence: true)
    }
}


