import UIKit

final class ATAppPickerViewController: UIViewController {
	private let modules = ATModuleRegistry.all

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Apps"
		view.backgroundColor = .systemBackground
		setupLayout()
	}

	private func setupLayout() {
		let buttons = modules.enumerated().map { index, module in
			let button = UIButton(configuration: configuredButton(for: module))
			button.tag = index
			button.addTarget(self, action: #selector(openModule(_:)), for: .touchUpInside)
			button.heightAnchor.constraint(equalToConstant: 72).isActive = true
			return button
		}

		let stackView = UIStackView(arrangedSubviews: buttons)
		stackView.axis = .vertical
		stackView.spacing = 20
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(stackView)

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
		])
	}

	private func configuredButton(for module: ATEmbeddedModule) -> UIButton.Configuration {
		var configuration = UIButton.Configuration.filled()
		configuration.title = module.displayName
		configuration.subtitle = module.subtitle
		configuration.cornerStyle = .large
		configuration.buttonSize = .large
		return configuration
	}

	@objc private func openModule(_ sender: UIButton) {
		guard modules.indices.contains(sender.tag) else { return }
		let module = modules[sender.tag]
		module.prepareIfNeeded()
		navigationController?.pushViewController(module.makeRootViewController(), animated: true)
	}
}
