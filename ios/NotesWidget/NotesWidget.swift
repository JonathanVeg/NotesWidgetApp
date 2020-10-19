//
//  NotesWidget.swift
//  NotesWidget
//
//  Created by Jonathan Silva on 16/10/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("widget_data", store: UserDefaults(suiteName: "group.notesapp.widget"))
    var data: Data = Data()
  
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widgetData: WidgetData(text: "Placeholder"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), widgetData: WidgetData(text: "Snapshot"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
      let widgetData = try? JSONDecoder().decode(WidgetData.self, from: data)
      
      var entries: [SimpleEntry] = []
  
      let entry = SimpleEntry(date: Date(), widgetData: (widgetData ?? WidgetData(text: "DEFAULT")))
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let widgetData: WidgetData
}

struct NotesWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
      VStack {
        Spacer()
        Text(entry.widgetData.text).font(.headline)
        Spacer()
        Text(entry.date, style: .time).font(.footnote)
      }
    }
}

@main
struct NotesWidget: Widget {
    let kind: String = "NotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            NotesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Notes Widget")
        .description("Crie nova homescreen note")
    }
}

struct NotesWidget_Previews: PreviewProvider {
    static var previews: some View {
        NotesWidgetEntryView(entry: SimpleEntry(date: Date(), widgetData: WidgetData(text: "Preview")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
