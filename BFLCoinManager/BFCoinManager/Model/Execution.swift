//
//  Execution.swift
//  BFLCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

enum SideType : String {
    case buy    = "BUY"
    case sell   = "SELL"
}
/*
    "id": 39287,
    "side": "BUY",
    "price": 31690,
    "size": 27.04,
    "exec_date": "2015-07-08T02:43:34.823",
    "buy_child_order_acceptance_id": "JRF20150707-200203-452209",
    "sell_child_order_acceptance_id": "JRF20150708-024334-060234"
 */
struct Execution {
    var executionId :UInt64
    var side :SideType
    var price :Int
    var size :Double
    var exeDate :Date
    var buyChildOrderAcceptanceId :String
    var sellChildOrderAcceptanceId :String
}
