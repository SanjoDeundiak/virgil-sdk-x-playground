import VirgilSDK
import VirgilCryptoApiImpl

let cardCrypto = VirgilCardCrypto()
let cardVerifier = VirgilCardVerifier(cardCrypto: cardCrypto)!

let authenticatedQueryToServerSide: ((String) -> Void) -> Void = { completion in
    completion("eyJraWQiOiI3MGI0NDdlMzIxZjNhMGZkIiwidHlwIjoiSldUIiwiYWxnIjoiVkVEUzUxMiIsImN0eSI6InZpcmdpbC1qd3Q7dj0xIn0.eyJleHAiOjE1MTg2OTg5MTcsImlzcyI6InZpcmdpbC1iZTAwZTEwZTRlMWY0YmY1OGY5YjRkYzg1ZDc5Yzc3YSIsInN1YiI6ImlkZW50aXR5LUFsaWNlIiwiaWF0IjoxNTE4NjEyNTE3fQ.MFEwDQYJYIZIAWUDBAIDBQAEQP4Yo3yjmt8WWJ5mqs3Yrqc_VzG6nBtrW2KIjP-kxiIJL_7Wv0pqty7PDbDoGhkX8CJa6UOdyn3rBWRvMK7p7Ak")
}

let accessTokenProvider = CallbackJwtProvider { tokenContext, completion in
    authenticatedQueryToServerSide { jwtString in
        completion(jwtString, nil)
    }
}

let cardManagerParams = CardManagerParams(cardCrypto: cardCrypto,
                                          accessTokenProvider: accessTokenProvider,
                                          cardVerifier: cardVerifier)

let cardManager = CardManager(params: cardManagerParams)

let privateKeyExporter = VirgilPrivateKeyExporter()
let privateKeyStorage = PrivateKeyStorage(privateKeyExporter: privateKeyExporter)

let crypto = VirgilCrypto()

let messageToEncrypt = "Hello, Bob!"
let dataToEncrypt = messageToEncrypt.data(using: .utf8)!

let alicePrivateKeyEntry = try! privateKeyStorage.load(withName: "Alice")
let alicePrivateKey = alicePrivateKeyEntry.privateKey as! VirgilPrivateKey

cardManager.searchCards(identity: "Bob").start { result in
    switch result {
    // Cards are obtained
    case .success(let cards):
        let bobRelevantCardsPublicKeys = cards.map { $0.publicKey } as! [VirgilPublicKey]
        
        let encryptedData = try! crypto.signThenEncrypt(dataToEncrypt, with: alicePrivateKey,
                                                        for: bobRelevantCardsPublicKeys)
        
    // Error occured
    case .failure(let error): break
    }
}


