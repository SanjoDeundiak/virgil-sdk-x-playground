import VirgilSDK
import VirgilCryptoApiImpl

let cardCrypto = VirgilCardCrypto()

let jwt = try! Jwt(stringRepresentation: "eyJraWQiOiI3MGI0NDdlMzIxZjNhMGZkIiwidHlwIjoiSldUIiwiYWxnIjoiVkVEUzUxMiIsImN0eSI6InZpcmdpbC1qd3Q7dj0xIn0.eyJleHAiOjE1MTg2OTg5MTcsImlzcyI6InZpcmdpbC1iZTAwZTEwZTRlMWY0YmY1OGY5YjRkYzg1ZDc5Yzc3YSIsInN1YiI6ImlkZW50aXR5LUFsaWNlIiwiaWF0IjoxNTE4NjEyNTE3fQ.MFEwDQYJYIZIAWUDBAIDBQAEQP4Yo3yjmt8WWJ5mqs3Yrqc_VzG6nBtrW2KIjP-kxiIJL_7Wv0pqty7PDbDoGhkX8CJa6UOdyn3rBWRvMK7p7Ak")
let accessTokenProvider = ConstAccessTokenProvider(accessToken: jwt)

let cardVerifier = VirgilCardVerifier(cardCrypto: cardCrypto)!

let cardManagerParams = CardManagerParams(cardCrypto: cardCrypto, accessTokenProvider: accessTokenProvider, cardVerifier: cardVerifier)

let authenticatedQueryToServerSide: (String, (String) -> Void) -> Void = { str, completion in
    completion(str)
}

cardManagerParams.signCallback = { rawCard, completion in
    let rawCardStr = try! rawCard.exportAsBase64EncodedString()
    // Send this string to server-side, where it will be signed
    authenticatedQueryToServerSide(rawCardStr) { response in
        let signedRawCard = try! RawSignedModel.import(fromBase64Encoded: response)
        
        completion(signedRawCard, nil)
    }
}
