import UIKit
import swift_toolbox

public class SwiftCrayonsUIViewController: UICollectionViewController, SwiftCrayonsViewController {
    
    public static func ctrl(didSaveColorscheme: @escaping (String?) -> Void) -> SwiftCrayonsUIViewController {
        let c = SwiftCrayonsUIViewController.fromStoryboard(bundle: .module, name: nil)
        c.didSaveColorscheme = didSaveColorscheme
        return c
    }
    
    var didSaveColorscheme: ((String?) -> Void)?
    
    // MARK: - Life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = navigationTitle
        
        let clearButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clear))
        
        
        navigationItem.rightBarButtonItems = [clearButton]
        
        collectionView.register(SwiftCrayonsSelectionCell.nib(Bundle.module), forCellWithReuseIdentifier: SwiftCrayonsSelectionCell.nibName)
        collectionView.register(SwiftCrayonsSelectCell.nib(Bundle.module), forCellWithReuseIdentifier: SwiftCrayonsSelectCell.nibName)
        
        collectionView.collectionViewLayout = BoardColorFlowLayout()
        collectionView.backgroundColor = Colorscheme.primaryColor
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = Colorscheme.primaryColor
        navigationController?.navigationBar.tintColor = Colorscheme.secondaryColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Colorscheme.secondaryColor]
        collectionView.collectionViewLayout = BoardColorFlowLayout()
        collectionView.backgroundColor = Colorscheme.primaryColor
        collectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func clear(_ sender: Any) {
        saveColor(nil)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func saveColor(_ colorName: String?) {
        ColorschemeDefault.boardColorString = colorName
        collectionView.reloadData()
        didSaveColorscheme?(colorName)
    }
    
    // MARK: - Collection View
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionsCount
    }
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemsCount(for: section)
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let selectionCell = SwiftCrayonsSelectionCell.from(collectionView: collectionView, for: indexPath)
            selectionCell.configure(colorScheme: MHColorScheme.colorSchemeBy(name: selectedColorName))
            return selectionCell
        default:
            let selectCell = SwiftCrayonsSelectCell.from(collectionView: collectionView, for: indexPath)
            let cn = colorName(for: indexPath.row)
            selectCell.configure(
                colorName: cn,
                color: MHColorScheme.colorSchemeBy(
                    name: cn
                ).backgroundColor,
                selected: ColorschemeDefault.boardColorString == cn
            )
            return selectCell
        }
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        saveColor(colorName(for: indexPath.row))
        setupUI()
    }
    
    // MARK: - Key commands
    
    public override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: UIKeyCommand.inputEscape, modifierFlags: [] , action: #selector(close)).nonRepeating
        ]
    }
}

class BoardColorFlowLayout: UICollectionViewFlowLayout {
}

extension SwiftCrayonsUIViewController : UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.section {
    case 0:
        return CGSize(width: collectionView.frame.size.width, height: 50)
    default:
        return CGSize(width: 50, height: 50)
    }
  }
}
