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

cardManager.getCard(withId: "f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8").start { result in
    switch result {
    // Card is obtained
    case .success(let card): break
    // Error occured
    case .failure(let error): break
    }
}
