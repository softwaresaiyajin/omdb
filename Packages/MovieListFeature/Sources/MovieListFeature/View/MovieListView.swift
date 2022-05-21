import SwiftUI
import Combine
import AppUI

struct MovieListView<
    ViewModel: MovieListViewModelInterface,
    ExternalViewFactory: ExternalViewFactoryInterface
>: View {
    @ObservedObject private var viewModel: ViewModel
    private let externalViewFactory: ExternalViewFactory
    
    init(
        viewModel: ViewModel,
        externalViewFactory: ExternalViewFactory
    ) {
        self.viewModel = viewModel
        self.externalViewFactory = externalViewFactory
    }
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Omdb Movies")
        }
        .onAppear(perform: viewModel.load)
        .searchable(text: $viewModel.searchText, prompt: "Search title or year")
    }
    
    @ViewBuilder
    private var contentView: some View {
        if viewModel.items.isEmpty {
            emptyView
        } else {
            listView
        }
    }
    
    private var emptyView: some View {
        Text(viewModel.searchText.isEmpty ? "Please enter text" : "No movies found")
            .font(.headline)
            .foregroundColor(.black)
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.items, id: \.self) { item in
                NavigationLink(
                    destination: externalViewFactory.makeMovieDetailView(id: item.id)
                ) {
                    MovieItemRow(data: item)
                }
            }
        }
        .background(Color.rowBackgroundColor)
        .listStyle(.insetGrouped)
    }
}
