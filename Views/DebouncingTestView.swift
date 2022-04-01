//
//  DebouncingTestView.swift
//  throttling-debouncing-test
//
//  Created by Carmine Porricelli on 31/03/22.
//

import SwiftUI

struct DebouncingTestView: View {
    @StateObject var viewModel = TestsViewModel()
    
    var body: some View {
        Form {
            TextField("User input", text: $viewModel.userInput)
            Text("Num. code executions: \(viewModel.executionTimes)")
            
            Button("Reset count") {
                viewModel.executionTimes = 0
            }
        }
        .onReceive(viewModel.$userInput.debounce(for: 1, scheduler: RunLoop.main)) { seachTerm in
            viewModel.executionTimes += 1
        }
    }
}

struct DebouncingTestView_Previews: PreviewProvider {
    static var previews: some View {
        DebouncingTestView()
    }
}
