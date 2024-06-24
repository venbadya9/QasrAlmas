import Foundation
import UIKit

extension ChatView {
    
    //MARK: Methods
    
    func configureView() {
        guard let chatView = Bundle.main.loadNibNamed("ChatView", owner: self)?.first as? UIView else { return }
        chatView.frame = self.bounds
        self.addSubview(chatView)
        
        configureUIComponents()
        registerKeyboardNotifications()
        loadMessage()
    }
    
    func configureUIComponents() {
        containerView.layer.cornerRadius = cornerRadius22
        sendButton.layer.cornerRadius = cornerRadius22
        
        textView.text = placeholder
    }
    
    // Loading message while preserving older mesages
    func loadMessage() {
        Messages.sharedInstance.messageArray.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
}

// MARK: UITextViewDelegate

extension ChatView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

//MARK: Keyboard Extension

extension ChatView {
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIControl.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIControl.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.frame.origin.y -= keyboardSize.height - safeAreaHeight
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        self.frame.origin.y = .zero
    }
}
