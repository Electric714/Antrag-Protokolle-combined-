import UIKit
import SwiftUI
import Protokolle

final class ATAppPickerViewController: UIViewController {
	private lazy var antragButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Antrag"
		configuration.cornerStyle = .large
		configuration.buttonSize = .large
		let button = UIButton(configuration: configuration)
		button.addTarget(self, action: #selector(openAntrag), for: .touchUpInside)
		return button
	}()

	private lazy var protokolleButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Protokolle"
		configuration.cornerStyle = .large
		configuration.buttonSize = .large
		let button = UIButton(configuration: configuration)
		button.addTarget(self, action: #selector(openProtokolle), for: .touchUpInside)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Apps"
		view.backgroundColor = .systemBackground
		setupLayout()
	}

	private func setupLayout() {
		let stackView = UIStackView(arrangedSubviews: [antragButton, protokolleButton])
		stackView.axis = .vertical
		stackView.spacing = 20
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(stackView)

		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			antragButton.heightAnchor.constraint(equalToConstant: 72),
			protokolleButton.heightAnchor.constraint(equalTo: antragButton.heightAnchor)
		])
	}

	@objc private func openAntrag() {
		navigationController?.pushViewController(ATAppsViewController(), animated: true)
	}

	@objc private func openProtokolle() {
		let controller = UIHostingController(rootView: ProtokolleRootView())
		controller.title = "Protokolle"
		navigationController?.pushViewController(controller, animated: true)
	}
}
