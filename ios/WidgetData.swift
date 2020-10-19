//
//  WidgetData.swift
//  NotesWidgetApp
//
//  Created by Jonathan Silva on 16/10/20.
//

import Foundation

struct WidgetData: Identifiable, Codable {
  var text: String
  var id: String { text }
}
