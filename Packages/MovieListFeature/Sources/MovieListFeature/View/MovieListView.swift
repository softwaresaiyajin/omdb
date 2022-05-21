import SwiftUI
import Combine

public struct MovieListView<
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
    
    public var body: some View {
        NavigationView {
            listView
        }
        .onAppear(perform: viewModel.load)
        .searchable(text: $viewModel.searchText, prompt: "Search title or year")
    }
    
    private var emptyView: some View {
        Text("")
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
        .listStyle(.insetGrouped)
        .navigationTitle("Omdb Movies")
    }
}
