//
//  WidgetHelper.swift
//  NotesWidgetApp
//
//  Created by Jonathan Silva on 16/10/20.
//

import Foundation
import SwiftUI
import WidgetKit

@available(iOS 14.0, *)
@objc(WidgetHelper)
class WidgetHelper: NSObject, RCTBridgeModule {
  @AppStorage("widget_data", store: UserDefaults(suiteName: "group.notesapp.widget"))
  var data: Data = Data()
  
  static func moduleName() -> String! {
    return "WidgetHelper"
  }
  
  
  @objc
  func UpdateNote(_ text: NSString) -> Void {
      let widgetData = WidgetData(text: text as String)
      guard let data = try? JSONEncoder().encode(widgetData) else {return}

    self.data = data
    
      WidgetCenter.shared.reloadAllTimelines()
  }
}
