//
//  DetailViewController.swift
//  CampusCompanion
//
//  Created by Z. on 10/14/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var messageLabel: UILabel!

    var studentName = ""
    var notificationsEnabled = false
    var selectedRole = ""
    var preferredEventDate = Date()
    var numberOfGuests = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campus Events"

        let notificationStatus = notificationsEnabled ? "on" : "off"
        let formattedDate = preferredEventDate.formatted(
            date: .abbreviated,
            time: .omitted
        )
        let guestDescription = numberOfGuests == 1
            ? "1 guest"
            : "\(numberOfGuests) guests"

        messageLabel.text = """
        Welcome, \(studentName)! (\(selectedRole))
        Notifications: \(notificationStatus).
        Preferred date: \(formattedDate).
        Guests: \(guestDescription).
        """
    }
}
