import Foundation
import VirgilCryptoApiImpl

let crypto = VirgilCrypto()

let privateKeyStr = "MIGhMF0GCSqGSIb3DQEFDTBQMC8GCSqGSIb3DQEFDDAiBBBtfBoM7VfmWPlvyHuGWvMSAgIZ6zAKBggqhkiG9w0CCjAdBglghkgBZQMEASoEECwaKJKWFNn3OMVoUXEcmqcEQMZ+WWkmPqzwzJXGFrgS/+bEbr2DvreVgEUiLKrggmXL9ZKugPKG0VhNY0omnCNXDzkXi5dCFp25RLqbbSYsCyw="

let privateKeyData = Data(base64Encoded: privateKeyStr)!

let privateKey = try! crypto.importPrivateKey(from: privateKeyData, password: "YOUR_PASSWORD")

