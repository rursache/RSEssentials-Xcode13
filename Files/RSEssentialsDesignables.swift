//
//  RSExtension Designables
//
//  Created by Radu Ursache - RanduSoft
//  v1.0.1
//

import UIKit
import RSEssentials

public extension UIBarButtonItem {
	@IBInspectable var localizableKey: String {
		set {
			title = newValue.localized()
		}
		get {
			return self.title ?? ""
		}
	}
}

public extension UIButton {
	@IBInspectable var localizableKey: String {
		set {
			setTitle(newValue.localized(), for: .normal)
		}
		get {
			return self.titleLabel?.text ?? ""
		}
	}
}

public extension UILabel {
	@IBInspectable var localizableKey: String {
		set {
			text = newValue.localized()
		}
		get {
			return self.text!
		}
	}
}

public extension UITextField {
	@IBInspectable var doneAccessory: Bool{
		get {
			return self.doneAccessory
		}
		set (hasDone) {
			if hasDone {
				addDoneButtonOnKeyboard()
			}
		}
	}

	@IBInspectable var localizableKey: String {
		set {
			placeholder = newValue.localized()
		}
		get {
			return self.placeholder ?? ""
		}
	}
}
public extension UITextView {
	@IBInspectable var doneAccessory: Bool {
		get {
			return self.doneAccessory
		}
		set (hasDone) {
			if hasDone {
				addDoneButtonOnKeyboard()
			}
		}
	}
	
	@IBInspectable var placeholder: String {
		get {
			return placeholderLabel.text ?? ""
		}
		set {
			let placeholderLabel = self.placeholderLabel
			if let validLocalizedPlaceholder = newValue.localizedIfValid() {
				placeholderLabel.text = validLocalizedPlaceholder
			} else {
				placeholderLabel.text = newValue
			}
			placeholderLabel.numberOfLines = 0
			let width = frame.width - textContainer.lineFragmentPadding * 2
			let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
			placeholderLabel.frame.size.height = size.height
			placeholderLabel.frame.size.width = width
			placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top)

			textStorage.delegate = self
			
			setNeedsLayout()
		}
	}
	
	@IBInspectable var placeholderColor: UIColor {
		get {
			return placeholderLabel.textColor
		}
		set {
			placeholderLabel.textColor = newValue
		}
	}
}

public extension UIView {
	@IBInspectable var cornerRadius: CGFloat {
		set {
			layer.cornerRadius = newValue
		}
		get {
			return layer.cornerRadius
		}
	}
}

