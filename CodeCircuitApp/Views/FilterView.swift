//
//  FilterView.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 24/03/2025.
//

import SwiftUI

struct FilterView: View {
    private var viewModel: EventFilterViewModel
    @State private var types: Set<Event.EventType>
    @State private var locationTypes: Set<Event.LocationType>
    @State private var educationStatuses: Set<Event.EducationStatus>
    @State private var freeSelected: Bool
    @State private var paidSelected: Bool
    @State private var includedSelected: Bool
    @State private var excludedSelected: Bool
    @State private var minAge: String
    @State private var maxAge: String
    @State private var minSize: String
    @State private var maxSize: String
    
    @Binding var showFilterView: Bool
    let action: () -> Void
    
    init(showFilterView: Binding<Bool>, viewModel: EventFilterViewModel, action: @escaping () -> Void) {
        _showFilterView = showFilterView
        self.action = action
        self.viewModel = viewModel
        
        _types = State(initialValue: viewModel.filters.types)
        _locationTypes = State(initialValue: viewModel.filters.locationTypes)
        _educationStatuses = State(initialValue: viewModel.filters.educationStatuses)
        _freeSelected = State(initialValue: viewModel.filters.entryFee != nil && viewModel.filters.entryFee == false ? true : false)
        _paidSelected = State(initialValue: viewModel.filters.entryFee != nil && viewModel.filters.entryFee == true ? true : false)
        _includedSelected = State(initialValue: viewModel.filters.prizePool != nil && viewModel.filters.prizePool == true ? true : false)
        _excludedSelected = State(initialValue: viewModel.filters.prizePool != nil && viewModel.filters.prizePool == false ? true : false)
        _minAge = State(initialValue: viewModel.filters.minAge != nil ? String(viewModel.filters.minAge ?? 0) : "")
        _maxAge = State(initialValue: viewModel.filters.maxAge != nil ? String(viewModel.filters.maxAge ?? 0) : "")
        _minSize = State(initialValue: viewModel.filters.minTeamSize != nil ? String(viewModel.filters.minTeamSize ?? 0) : "")
        _maxSize = State(initialValue: viewModel.filters.maxTeamSize != nil ? String(viewModel.filters.maxTeamSize ?? 0) : "")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                eventTypeSection
                locationTypeSection
                educationStatusSection
                entryFeeSection
                prizePoolSection
                ageRestrictionsSection
                teamSizeSection
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showFilterView = false
                    } label: {
                        Text("Close")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFilterView = false
                        viewModel.updateFilters(types: types, locationTypes: locationTypes, educationStatuses: educationStatuses, paidSelected: paidSelected, freeSelected: freeSelected, includedSelected: includedSelected, excludedSelected: excludedSelected, minAge: minAge, maxAge: maxAge, minTeamSize: minSize, maxTeamSize: maxSize)
                        action()
                    } label: {
                        Text("Apply")
                            .bold()
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Ok") {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        .bold()
                    }
                }
            }
        }
    }
    
    // MARK: - Sections
    
    private var eventTypeSection: some View {
        FilterSection(header: "Event Type", items: Event.EventType.allCases) { type in
            FilterButton(text: type.rawValue, action: {
                toggleFilter(type, in: &types)
            }, selected: types.contains(type))
        }
    }
    
    private var locationTypeSection: some View {
        FilterSection(header: "Location Type", items: Event.LocationType.allCases) { type in
            FilterButton(text: type.rawValue, action: {
                toggleFilter(type, in: &locationTypes)
            }, selected: locationTypes.contains(type))
        }
    }
    
    private var educationStatusSection: some View {
        FilterSection(header: "Education Status Eligibility", items: Event.EducationStatus.allCases) { type in
            FilterButton(text: EligibilityLabel.filterEligibleLabel(type), action: {
                toggleFilter(type, in: &educationStatuses)
            }, selected: educationStatuses.contains(type))
        }
    }
    
    private var entryFeeSection: some View {
        Section(header: Text("Entry Fee").font(.headline)) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                FilterButton(text: "free", action: {
                    freeSelected.toggle()
                }, selected: freeSelected)
                FilterButton(text: "paid", action: {
                    paidSelected.toggle()
                }, selected: paidSelected)
            }
            .listRowBackground(Color.clear)
        }
    }
    
    private var prizePoolSection: some View {
        Section(header: Text("Prize Pool").font(.headline)) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                FilterButton(text: "included", action: {
                    includedSelected.toggle()
                }, selected: includedSelected)
                FilterButton(text: "excluded", action: {
                    excludedSelected.toggle()
                }, selected: excludedSelected)
            }
            .listRowBackground(Color.clear)
        }
    }
    
    private var ageRestrictionsSection: some View {
        Section(header: Text("Age Restrictions").font(.headline)) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                NumberField(name: "Min", value: $minAge)
                NumberField(name: "Max", value: $maxAge)
            }
            .listRowBackground(Color.clear)
        }
    }
    
    private var teamSizeSection: some View {
        Section(header: Text("Team Size Restrictions").font(.headline)) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                NumberField(name: "Min", value: $minSize)
                NumberField(name: "Max", value: $maxSize)
            }
            .listRowBackground(Color.clear)
        }
    }
    
    private func toggleFilter<T: Hashable>(_ type: T, in set: inout Set<T>) {
        withAnimation(.easeIn(duration: 0.1)) {
            if set.contains(type) {
                set.remove(type)
            } else {
                set.insert(type)
            }
        }
    }
}

// MARK: - Helper View

struct FilterSection<T: Hashable, Content: View>: View {
    let header: String
    let items: [T]
    let content: (T) -> Content
    
    var body: some View {
        Section(header: Text(header).font(.headline)) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(items, id: \.self) { item in
                    content(item)
                }
            }
        }
        .listRowBackground(Color.clear)
    }
}

//
//#Preview {
//    @Previewable @State var isPresented = true
//
//    FilterView(showFilterView: $isPresented, action: { print("Action") })
//        .environment(EventFilterViewModel())
//}
