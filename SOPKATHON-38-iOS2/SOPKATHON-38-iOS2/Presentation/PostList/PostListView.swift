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
    
    var onCellSelect: ((IndexPath) -> Void)?
    
    private let iconView = UIImageView()
    private let titleLabel1 = UILabel()
    private let titleLabel2 = UILabel()
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
        addSubviews(iconView, titleLabel1, titleLabel2, sortButton, collectionView, addButton)
    }
    
    override func setLayout() {
        iconView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(39)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(30)
        }
        
        titleLabel1.snp.makeConstraints {
            $0.centerY.equalTo(iconView)
            $0.leading.equalTo(iconView.snp.trailing)
        }
        
        titleLabel2.snp.makeConstraints {
            $0.centerY.equalTo(iconView)
            $0.leading.equalTo(titleLabel1.snp.trailing)
        }
        
        sortButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel1)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(106)
            $0.height.equalTo(31)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(iconView.snp.bottom).offset(17)
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
        
        iconView.do {
            $0.image = UIImage(resource: .iconFireworks)
        }
        
        titleLabel1.do {
            $0.text = "라인프렌즈"
            $0.font = .body_sb_18
            $0.textColor = .main500
        }
        
        titleLabel2.do {
            $0.text = "의 이야기"
            $0.font = .body_sb_18
            $0.textColor = .gray900
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
        collectionView.delegate = self
    }
    
    private func register() {
        collectionView.register(PostChipCell.self, forCellWithReuseIdentifier: PostChipCell.identifier)
    }
    
    func addTargetToAddButton(_ target: Any?, action: Selector) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCellSelect?(indexPath)
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
