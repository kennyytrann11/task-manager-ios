//
//  DateFormatting.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/17/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}


