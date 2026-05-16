//
//  AddPostView.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class AddPostView: BaseView {

    private let categories = ["설렘", "억까", "비밀", "싸움", "감동"]
    private let maxTitleLength = 5
    
    private var selectedCategoryIndex: Int? = nil
    var onCategorySelect: ((Int) -> Void)?
    var onTitleChange: ((String) -> Void)?
    
    private let normalBackgroundColor: UIColor = .white
    private let selectedBackgroundColor: UIColor = .main500
    private let normalTextColor: UIColor = .gray600
    private let selectedTextColor: UIColor = .white
    private let normalBorderColor: UIColor = .gray200
    private let selectedBorderColor: UIColor = .clear

    private let categoryLabel = UILabel()
    private let categoryStackView = UIStackView()
    private lazy var categoryButtons: [UIButton] = categories.map { _ in UIButton() }

    private let titleLabel = UILabel()
    private let titleStackView = UIStackView()
    private let titleBoxes: [UIView] = (0..<5).map { _ in UIView() }
    private let titleBoxLabels: [UILabel] = (0..<5).map { _ in UILabel() }
    private let titleTextField = UITextField()

    private let contentLabel = UILabel()
    private let contentContainerView = UIImageView()
    private let placeholderLabel = UILabel()

    private let submitButton = PingoButton(buttonColor: .main500, titleColor: .white, title: "작성 완료")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCategoryAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setUI() {
        categoryButtons.forEach { categoryStackView.addArrangedSubview($0) }
        titleBoxes.forEach { titleStackView.addArrangedSubview($0) }
        contentContainerView.addSubview(placeholderLabel)
        
        zip(titleBoxes, titleBoxLabels).forEach { box, label in
                box.addSubview(label)
            }

        addSubviews(
            categoryLabel,
            categoryStackView,
            titleLabel,
            titleStackView,
            titleTextField,
            contentLabel,
            contentContainerView,
            submitButton
        )
    }

    override func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(16)
        }
        
        categoryButtons.forEach { button in
            button.snp.makeConstraints {
                $0.width.equalTo(64)
            }
        }

        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(34)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }

        titleStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }

        titleBoxes.forEach { box in
            box.snp.makeConstraints {
                $0.size.equalTo(50)
            }
        }
        
        titleBoxLabels.forEach { label in
            label.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
        
        titleTextField.snp.makeConstraints {
            $0.edges.equalTo(titleStackView)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }

        contentContainerView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.size.equalTo(341)
        }
        
        placeholderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(28)
        }

        submitButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(54)
        }
    }
    
    override func setStyle() {
        backgroundColor = .white
        
        titleBoxLabels.forEach { label in
            label.do {
                $0.font = .body_sb_18
                $0.textColor = .black
                $0.textAlignment = .center
            }
        }
        
        categoryLabel.do {
            $0.text = "어떤 썰이야?"
            $0.font = .body_sb_18
            $0.textColor = .black
        }
        
        zip(categoryButtons, categories).forEach { button, title in
            button.do {
                $0.setTitle(title, for: .normal)
                $0.setTitleColor(.gray600, for: .normal)
                $0.titleLabel?.font = .body_m_16
                $0.backgroundColor = .white
                $0.layer.cornerRadius = 17
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor.gray200.cgColor
            }
        }
        
        categoryStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fillEqually
        }
        
        titleLabel.do {
            $0.text = "제목을 다섯 글자로 적어줘"
            $0.font = .body_sb_18
            $0.textColor = .black
        }
        
        titleBoxes.forEach { box in
            box.do {
                $0.backgroundColor = .gray100
                $0.layer.cornerRadius = 4
            }
        }
        
        titleStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
        
        titleTextField.do {
            $0.backgroundColor = .clear
            $0.textColor = .clear
            $0.tintColor = .clear
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
            $0.delegate = self
            $0.addTarget(self, action: #selector(titleDidChange), for: .editingChanged)
        }
        
        contentLabel.do {
            $0.text = "자세히 적어줘"
            $0.font = .body_sb_18
            $0.textColor = .black
        }
        
        contentContainerView.do {
            $0.image = UIImage(resource: .imgHeart)
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        placeholderLabel.do {
            $0.text = "내용"
            $0.font = .body_m_18
            $0.textColor = .gray900
        }
        
        submitButton.do {
            $0.titleLabel?.font = .body_sb_16
        }
    }
    
    private func setCategoryAction() {
        categoryButtons.enumerated().forEach { index, button in
            button.tag = index
            button.addTarget(self, action: #selector(categoryButtonDidTap(_:)), for: .touchUpInside)
        }
    }

    @objc private func categoryButtonDidTap(_ sender: UIButton) {
        selectedCategoryIndex = sender.tag
        updateCategorySelection()
        onCategorySelect?(sender.tag)
    }

    private func updateCategorySelection() {
        categoryButtons.enumerated().forEach { index, button in
            let isSelected = (index == selectedCategoryIndex)
            button.backgroundColor = isSelected ? selectedBackgroundColor : normalBackgroundColor
            button.setTitleColor(isSelected ? selectedTextColor : normalTextColor, for: .normal)
            button.layer.borderColor = (isSelected ? selectedBorderColor : normalBorderColor).cgColor
        }
    }
    
    @objc private func titleDidChange() {
        let text = titleTextField.text ?? ""
        let chars = Array(text)
        
        titleBoxLabels.enumerated().forEach { index, label in
            label.text = index < chars.count ? String(chars[index]) : ""
        }
        
        onTitleChange?(text)
    }
}

extension AddPostView: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= maxTitleLength
    }
}
