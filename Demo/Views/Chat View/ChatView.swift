import UIKit

class ChatView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    //MARK: IBActions
    
    @IBAction func sendTapped(_ sender: UIButton) {
        guard let headerColor = shamrock,
        let textColor = quillGray,
        let font = UIFont(name: matchFont, size: 14.0) else { return }
        
        // Creating attributed string
        if textView.text != placeholder {
            let textLabel = UILabel()
            let messageText = "UserName: \(textView.text ?? "")"
            let range = (messageText as NSString).range(of: "UserName:")
            let attributedString = NSMutableAttributedString(string: messageText)
            attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: NSRange(location: 0, length: attributedString.length))
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: headerColor, range: range)
            
            textLabel.attributedText = attributedString
            textLabel.numberOfLines = 0
            
            Messages.sharedInstance.messageArray.append(textLabel)
            loadMessage()
            
            textView.text = nil
            textView.resignFirstResponder()
        }
    }
}
