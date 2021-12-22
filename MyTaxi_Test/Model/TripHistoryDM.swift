//
//  TripHistoryDM.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 21.12.2021.
//

import UIKit


struct TripHistoryDM {
    var date: String
    var trips: [TripDM]
}

struct TripDM {
    var from: String
    var to: String
    var img: String
    var time: String
}
