import SwiftUI
import MovieServiceInterface
import InternationalizationServiceInterface
import AppUI

struct MovieDetailView<
    ViewModel: MovieDetailViewModelInterface
>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        contentView
            .background(Color.primaryBackgroundColor)
            .onAppear(perform: viewModel.load)
            .navigationTitle(viewModel.item?.title ?? ~Slug.loadingInfo)
    }
    
    @ViewBuilder
    private var contentView: some View {
        if let item = viewModel.item {
            ScrollView {
                VStack(alignment: .center, spacing: .spacingS) {
                    makeHeaderView(item: item)
                    
                    makeReleaseView(item: item)
                    
                    makeCastView(item: item)
                    
                    Spacer(minLength: 0)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        } else {
            ProgressView()
        }
    }
    
    private func makeHeaderView(item: MovieItemDetailedInfo) -> some View {
        MovieDetailHeaderView(
            posterURL: item.poster,
            plot: item.plot
        )
    }
    
    private func makeReleaseView(item: MovieItemDetailedInfo) -> some View {
        MovieDetailReleaseInfoView(
            year: item.year,
            language: item.language,
            duration: item.duration
        )
    }
    
    private func makeCastView(item: MovieItemDetailedInfo) -> some View {
        MovieDetailCastView(actors: item.actors)
    }
}
