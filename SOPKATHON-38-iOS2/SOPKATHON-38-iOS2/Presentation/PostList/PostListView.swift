//
//  PostListView.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PostListView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let titleLabel = UILabel()
    private let sortButton = SortButton()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: make())
    
    private let addButton = PingoButton(buttonColor: .main500, titleColor: .white, title: "썰 추가하기")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(titleLabel, sortButton, collectionView, addButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        sortButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(43)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(77)
            $0.height.equalTo(31)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    override func setStyle() {
        backgroundColor = .gray100
        
        titleLabel.do {
            $0.text = "지금 여기의 이야기..."
            $0.font = .body_sb_18
            $0.textColor = .black
        }
        
        collectionView.do {
            $0.backgroundColor = .gray100
            $0.showsHorizontalScrollIndicator = false
            $0.clipsToBounds = false
        }
        
        addButton.do {
            $0.titleLabel?.font = .body_sb_16
        }
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(PostChipCell.self, forCellWithReuseIdentifier: PostChipCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            numberOfItemsInSection section: Int) -> Int {
            return 10
        }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostChipCell.identifier,
            for: indexPath
        ) as? PostChipCell else { return UICollectionViewCell() }
        return cell
    }
    
    private static func make() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150),
            heightDimension: .absolute(150)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous

        return UICollectionViewCompositionalLayout(section: section)
    }
}
