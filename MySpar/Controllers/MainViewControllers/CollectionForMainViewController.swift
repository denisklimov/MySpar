//
//  CollectionForMainViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

class CollectionForMainViewController: UICollectionViewController {
    
    private typealias CollectionVieDiffableDataSource = UICollectionViewDiffableDataSource<Section, UUID>
    private typealias DiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, UUID>
    
    private enum Section: Int, CaseIterable {
        case stories
        case banners
        case bonus
        case services
        case recommend
        case sweets
    }
    
    private var dataSource: CollectionVieDiffableDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = createDataSource()

        var snapshot = DiffableDataSourceSnapshot()
        
        snapshot.appendSections(Section.allCases)
        let storiesIDs = DataOfModels.stories.map { $0.id }
        snapshot.appendItems(storiesIDs, toSection: .stories)
        
        let bannersIDs = DataOfModels.banners.map { $0.id }
        snapshot.appendItems(bannersIDs, toSection: .banners)
        
        let bonusID = DataOfModels.bonus.map { $0.id }
        snapshot.appendItems(bonusID, toSection: .bonus)
        
        let servicesIDs = DataOfModels.services.map { $0.id }
        snapshot.appendItems(servicesIDs, toSection: .services)
        
        let recommendationsIDs = DataOfModels.recomendations.map {$0.id}
        snapshot.appendItems(recommendationsIDs, toSection: .recommend)
        
        let sweetsIDs = DataOfModels.sweets.map { $0.id }
        snapshot.appendItems(sweetsIDs, toSection: .sweets)
        dataSource.apply(snapshot)
    }
    
    private func createDataSource() -> CollectionVieDiffableDataSource {
        
        let storyCellRegistration = UICollectionView.CellRegistration<StoryCollectionViewCell, StoryModel> { cell, indexPath, itemModel in
            cell.itemModel = itemModel
        }
        
        let specialOfferCellRegistration = UICollectionView.CellRegistration<BannerCollectionViewCell, BannerModel> { cell, indexPath, itemModel in
            cell.itemModel = itemModel
        }
        
        let bonusStatusCellRegistration = UICollectionView.CellRegistration<BonusStatusCollectionViewCell, BonusModel> { cell, indexPath, item in
            cell.bonus.text = "Бонусов: \(item.bounus)"
        }
        
        let serviceCellRegistration = UICollectionView.CellRegistration<ServiceConfCollectionViewCell, ServiceModel> { cell, indexPath, item in
            cell.item = item
            }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCollectionViewCell, ProductModel> { cell, indexPath, item in
            cell.item = item
        }
        
        let headerCellRegistration = UICollectionView.SupplementaryRegistration<CollectionViewSectionHeaderView>(elementKind: CollectionViewSectionHeaderView.elementKind) { supplementaryView, elementKind, indexPath in
            
            var title: String?
            
            switch Section(rawValue: indexPath.section) {
                
            case .recommend:
                title = "Рекомендуем"
            case .sweets:
                title = "Сладкое настроение"
            case .stories:
                title = nil
            case .banners:
                title = nil
            case .bonus:
                title = nil
            case .services:
                title = nil
            default:
                title = nil
            }
            
            supplementaryView.title.text = title
        }
        
        dataSource = CollectionVieDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            
            switch Section(rawValue: indexPath.section) {
            
            case .stories:
                let itemModel = DataOfModels.stories.first(where: { $0.id == itemIdentifier })
                let cell = collectionView.dequeueConfiguredReusableCell(using: storyCellRegistration, for: indexPath, item: itemModel)
                return cell
            
            case .banners:
                let itemModel = DataOfModels.banners.first(where: { $0.id == itemIdentifier })
                let cell = collectionView.dequeueConfiguredReusableCell(using: specialOfferCellRegistration, for: indexPath, item: itemModel)
                return cell
                
            case .bonus:
                let item = DataOfModels.bonus.first(where: { $0.id == itemIdentifier })
                let cell = collectionView.dequeueConfiguredReusableCell(using: bonusStatusCellRegistration, for: indexPath, item: item)
                return cell
                
            case .services:
                let item = DataOfModels.services.first(where: { $0.id == itemIdentifier } )
                let cell = collectionView.dequeueConfiguredReusableCell(using: serviceCellRegistration, for: indexPath, item: item)
                return cell
                
            case .recommend:

                let item = DataOfModels.recomendations.first(where: { $0.id == itemIdentifier })
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
                
            case .sweets:
                let item = DataOfModels.sweets.first(where: { $0.id == itemIdentifier })
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
            
            case .none:
                return nil
            }

        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
        
        return dataSource
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let compositionalLayout = UICollectionViewCompositionalLayout { [self] section, environment in
            
            switch Section(rawValue: section) {
            
            case .none:
                return nil
                
            case .some(.stories): return storiesSectionLayout()

            case .some(.banners): return bannersSectionLayout()

            case .some(.bonus): return bonusStatusSectionLayout()
                
            case .some(.services): return servicesSectionLayout()
                
            case .some(.recommend): return productSectionLayout()
    
            case .some(.sweets): return productSectionLayout()
            }

        }
        
        return compositionalLayout
    }

}

//MARK: Layout extansion

extension CollectionForMainViewController {
   
    private func storiesSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5)
        
        return section
    }
    
    private func bannersSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        return section
    }
    
    private func bonusStatusSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    private func servicesSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5)
        
        return section
    }
    
    private func productSectionLayout() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45.0))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CollectionViewSectionHeaderView.elementKind, alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
}
