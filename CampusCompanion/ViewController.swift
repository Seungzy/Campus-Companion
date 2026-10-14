//
//  ViewController.swift
//  CampusCompanion
//
//  Created by Z. on 10/5/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var notifySwitch: UISwitch!
    @IBOutlet private weak var roleSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var eventDatePicker: UIDatePicker!
    @IBOutlet private weak var guestStepper: UIStepper!
    @IBOutlet private weak var guestCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Campus Companion"
        updateGuestCountLabel()
    }

    @IBAction private func guestCountChanged(_ sender: UIStepper) {
        updateGuestCountLabel()
    }

    @IBAction private func nameEditingDidEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction private func exploreButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue",
              let destination = segue.destination as? DetailViewController else {
            return
        }

        let enteredName = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        destination.studentName = enteredName.isEmpty ? "Student" : enteredName
        destination.notificationsEnabled = notifySwitch.isOn
        destination.selectedRole = roleSegmentedControl.selectedSegmentIndex == 0
            ? "Student"
            : "Faculty"
        destination.preferredEventDate = eventDatePicker.date
        destination.numberOfGuests = max(Int(guestStepper.value), 1)
    }

    private func updateGuestCountLabel() {
        let guestCount = max(Int(guestStepper.value), 1)
        guestCountLabel.text = guestCount == 1
            ? "1 guest"
            : "\(guestCount) guests"
    }
}
