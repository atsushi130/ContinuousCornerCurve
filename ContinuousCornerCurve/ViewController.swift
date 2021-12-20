//
//  ViewController.swift
//  ContinuousCornerCurve
//
//  Created by Atsushi Miyake on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let circularView = RoundedView(cornerCurve: .circular, color: .blue)
        self.view.addSubview(circularView)
        circularView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circularView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            circularView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            circularView.widthAnchor.constraint(equalToConstant: 160),
            circularView.heightAnchor.constraint(equalTo: circularView.widthAnchor)
        ])

        let continuousView = RoundedView(cornerCurve: .continuous, color: .red)
        self.view.addSubview(continuousView)
        continuousView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continuousView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            continuousView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            continuousView.widthAnchor.constraint(equalToConstant: 160),
            continuousView.heightAnchor.constraint(equalTo: continuousView.widthAnchor)
        ])
    }
}

final class RoundedView: UIView {

    private let cornerRadius: CGFloat
    private let cornerCurve: CALayerCornerCurve
    private let color: UIColor

    init(radius: CGFloat = 50, cornerCurve: CALayerCornerCurve, color: UIColor) {
        self.cornerRadius = radius
        self.cornerCurve  = cornerCurve
        self.color        = color
        super.init(frame: .zero)
        self.commonInit()
    }

    override init(frame: CGRect) {
        self.cornerRadius = 40
        self.cornerCurve  = .circular
        self.color        = .blue
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.cornerCurve  = self.cornerCurve
        self.backgroundColor    = self.color
    }
}
