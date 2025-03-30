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
        
        _types = State(initialValue: viewModel.types)
        _locationTypes = State(initialValue: viewModel.locationTypes)
        _educationStatuses = State(initialValue: viewModel.educationStatuses)
        _freeSelected = State(initialValue: viewModel.entryFee != nil && viewModel.entryFee == false ? true : false)
        _paidSelected = State(initialValue: viewModel.entryFee != nil && viewModel.entryFee == true ? true : false)
        _includedSelected = State(initialValue: viewModel.prizePool != nil && viewModel.prizePool == true ? true : false)
        _excludedSelected = State(initialValue: viewModel.prizePool != nil && viewModel.prizePool == false ? true : false)
        _minAge = State(initialValue: viewModel.minAge != nil ? String(viewModel.minAge ?? 0) : "")
        _maxAge = State(initialValue: viewModel.maxAge != nil ? String(viewModel.maxAge ?? 0) : "")
        _minSize = State(initialValue: viewModel.minTeamSize != nil ? String(viewModel.minTeamSize ?? 0) : "")
        _maxSize = State(initialValue: viewModel.maxTeamSize != nil ? String(viewModel.maxTeamSize ?? 0) : "")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Event Type").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(Event.EventType.allCases, id: \.self) { type in
                            FilterButton(text: type.rawValue, action: {
                                toggleFilter(type, in: &types)
                            }, selected: types.contains(type))
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                Section(header: Text("Location Types").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(Event.LocationType.allCases, id: \.self) { type in
                            FilterButton(text: type.rawValue, action: {
                                toggleFilter(type, in: &locationTypes)
                            }, selected: locationTypes.contains(type))
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                Section(header: Text("Education Status Eligibility").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(Event.EducationStatus.allCases, id: \.self) { type in
                            FilterButton(text: EligibilityLabel.filterEligibleLabel(type), action: {
                                toggleFilter(type, in: &educationStatuses)
                            }, selected: educationStatuses.contains(type))
                        }
                    }
                    .listRowBackground(Color.clear)
                }
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
                Section(header: Text("Age Restrictions").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        NumberField(name: "Min", value: $minAge)
                        NumberField(name: "Max", value: $maxAge)
                    }
                    .listRowBackground(Color.clear)
                }
                Section(header: Text("Team Size Restrictions").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        NumberField(name: "Min", value: $minSize)
                        NumberField(name: "Max", value: $maxSize)
                    }
                    .listRowBackground(Color.clear)
                }
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
                        
                        pushToViewModel()
                        
                        action()
                        
                        print(viewModel.types)
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
    
    private func updateEntryFee() {
        if freeSelected && paidSelected {
            viewModel.entryFee = nil
        } else if paidSelected {
            viewModel.entryFee = true
        } else if freeSelected {
            viewModel.entryFee = false
        } else {
            viewModel.entryFee = nil
        }
    }
    
    private func updatePrizePool() {
        if includedSelected && excludedSelected {
            viewModel.prizePool = nil
        } else if includedSelected {
            viewModel.prizePool = true
        } else if excludedSelected {
            viewModel.prizePool = false
        } else {
            viewModel.prizePool = nil
        }
    }
    
    private func pushToViewModel() {
        viewModel.types = types
        viewModel.locationTypes = locationTypes
        viewModel.educationStatuses = educationStatuses
        viewModel.minAge = Int(minAge)
        viewModel.maxAge = Int(maxAge)
        viewModel.minTeamSize = Int(minSize)
        viewModel.maxTeamSize = Int(maxSize)
        updateEntryFee()
        updatePrizePool()
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
//
//#Preview {
//    @Previewable @State var isPresented = true
//
//    FilterView(showFilterView: $isPresented, action: { print("Action") })
//        .environment(EventFilterViewModel())
//}
