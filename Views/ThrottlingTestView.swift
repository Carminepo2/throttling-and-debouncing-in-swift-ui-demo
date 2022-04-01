//
//  ThrottlingTestView.swift
//  throttling-debouncing-test
//
//  Created by Carmine Porricelli on 31/03/22.
//

import SwiftUI

class TestsViewModel: ObservableObject {
    @Published var userInput = ""
    @Published var executionTimes = 0
}

struct ThrottlingTestView: View {
    @StateObject var viewModel = TestsViewModel()
    
    var body: some View {
        Form {
            TextField("User input", text: $viewModel.userInput)
            Text("Num. code executions: \(viewModel.executionTimes)")
            
            Button("Reset count") {
                viewModel.executionTimes = 0
            }
        }
        .onReceive(viewModel.$userInput.throttle(for: 1, scheduler: RunLoop.main, latest: true)) { seachTerm in
            viewModel.executionTimes += 1
        }
    }
}

struct ThrottlingTestView_Previews: PreviewProvider {
    static var previews: some View {
        ThrottlingTestView()
    }
}
