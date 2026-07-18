import SwiftUI

struct TodoListView: View {

    @State private var task = ""
    @State private var tasks: [String] = []

        var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                Text("Task App")
                    .font(.largeTitle)
                    .bold()

                TextField("Enter a task", text: $task)
                    .textFieldStyle(.roundedBorder)

                Button("Add Task") {
                    if !task.isEmpty {
                        tasks.append(task)
                        task = ""
                    }
                }

                List(tasks, id: \.self) { task in
                    Text(task)
                }
            }
            .padding()

        }
}

#Preview {
  TodoListView()
}
