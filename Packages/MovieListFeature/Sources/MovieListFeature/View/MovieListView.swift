import SwiftUI
import Combine

public struct MovieListView<ViewModel: MovieListViewModelInterface>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            listView
        }
        .searchable(text: $viewModel.searchText, prompt: "Search title or year")
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.items, id: \.self) { item in
                MovieItemRow(data: item)
            }
        }
        .listStyle(.inset)
    }
}
