import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newItemTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Todo", text: $newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !newItemTitle.isEmpty else { return }
                        viewModel.addItem(title: newItemTitle)
                        newItemTitle = ""
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 10)
                }
                .padding()

                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Text(item.title)
                                .strikethrough(item.isCompleted, color: .gray)
                            Spacer()
                            Button(action: {
                                viewModel.toggleCompletion(item: item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Todo List Project")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
