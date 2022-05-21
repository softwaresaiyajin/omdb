import SwiftUI
import Combine
import InternationalizationServiceInterface
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
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: ~Slug.searchPlaceholder
        )
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
        Text(~Slug.noMoviesFound)
            .font(.headline)
            .foregroundColor(.primary)
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
