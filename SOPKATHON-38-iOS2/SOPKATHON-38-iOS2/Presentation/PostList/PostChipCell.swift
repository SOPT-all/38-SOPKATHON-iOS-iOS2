//
//  PostChipCell.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PostChipCell: UICollectionViewCell {
    
    static let identifier: String = "PostChipCell"
    
    private let titleLabel = UILabel()
    private let chevronImageView = UIImageView()
    private let subtitleLabel = UILabel()
    private let thumbnailImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView
            .addSubviews(
                titleLabel,
                chevronImageView,
                subtitleLabel,
                thumbnailImageView
            )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(14)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(37)
            $0.centerY.equalTo(titleLabel)
            $0.size.equalTo(24)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
    }
    
    private func setStyle() {
        contentView.do {
            $0.backgroundColor = .gray300
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.text = "커플개싸움"
            $0.font = .body_sb_16
            $0.textColor = .white
        }
        
        chevronImageView.do {
            $0.image = UIImage(resource: .icChevronRightS)
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
        }
        
        subtitleLabel.do {
            $0.text = "라인프렌즈에서 커플.."
            $0.font = .caption_sb_12
            $0.textColor = .white
            $0.lineBreakMode = .byTruncatingTail
            $0.numberOfLines = 1
        }
    }
}

extension PostChipCell {
    func configure(title: String, subtitle: String, image: UIImage? = nil) {
            titleLabel.text = title
            subtitleLabel.text = subtitle
            if let image { thumbnailImageView.image = image }
        }
}
