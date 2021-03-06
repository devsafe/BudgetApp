//
//  AddView.swift
//  BudgetApp
//
//  Created by Сахар Кубический on 07.05.2021.
//

import SwiftUI



struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Business", "Personal"]
    

    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Cost name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .accentColor(.yellow)
                TextField("Cost value", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add cost")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })

            
        }
        

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
