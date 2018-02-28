import VirgilSDK
import VirgilCryptoApiImpl

let crypto = VirgilCrypto()
let keyPair = try! crypto.generateKeyPair()
let publicKeyData = try! crypto.exportPublicKey(keyPair.publicKey)
let publicKeyStr = publicKeyData.base64EncodedString()

let cardCrypto = VirgilCardCrypto()
let yourBackendVerifierCredenetials =
    VerifierCredentials(signer: "YOUR_BACKEND",
                        publicKey: Data(base64Encoded: publicKeyStr)!)

let yourBackendWhiteList =
    try! WhiteList(verifiersCredentials: [yourBackendVerifierCredenetials])

let cardVerifier = VirgilCardVerifier(cardCrypto: cardCrypto,
                                      whiteLists: [yourBackendWhiteList])
