//
//  CodeScannerView.swift
//  SwiftUI_QRcodeScanner
//
//  Created by Ahngeunwoo on 2020/10/18.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                if self.scannedCode != nil {
                    Text("self.scannedCode : \(self.scannedCode!)")
                }
                Button("Scan Code") {
                    self.isPresentingScanner = true
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Text("Scan a QR code to begin")
            }

        }
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
