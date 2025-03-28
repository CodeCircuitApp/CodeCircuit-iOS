//
//  EventListView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 17/03/2025.
//

import SwiftUI

struct EventListView: View {
    @Environment(EventViewModel.self) private var eventViewModel: EventViewModel
    @State private var eventFilterViewModel = EventFilterViewModel()
    @State private var showFilterView = false
    @State private var page = 1
    
    let events: [Event]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(events) { event in
                        NavigationLink(value: event) {
                            EventCardView(event: event)
                        }
                        .onAppear {
                            if event == events.last && !eventViewModel.gotAllEvents {
                                eventViewModel.fetchEvents(sizePerPage: 10, page: $page)
                            }
                        }
                    }
                    loadingIndicator
                }
            }
            .sheet(isPresented: $showFilterView) {
                FilterView(showFilterView: $showFilterView, viewModel: eventFilterViewModel) {
                    print(eventFilterViewModel.locationTypes)
                }
                .presentationDetents([.medium])
            }
            .onAppear() {
                eventViewModel.fetchEvents(sizePerPage: 10, page: $page)
            }
            .navigationDestination(for: Event.self) { event in
                EventView(event: event)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var loadingIndicator: some View {
        if eventViewModel.isFetching {
            Section {
                HStack {
                    Spacer()
                    ProgressView()
                        .controlSize(.extraLarge)
                    Spacer()
                }
                .padding()
                .id(UUID())
                .listRowBackground(Color.clear)
            }
        }
    }
}

#Preview {
    EventListView(events: Event.mockEvents)
        .environment(EventViewModel())
}
