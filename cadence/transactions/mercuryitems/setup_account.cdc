import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import MercuryItems from "../../contracts/MercuryItems.cdc"

// This transaction configures an account to hold Mercury Items.

transaction {
    prepare(signer: AuthAccount) {
    
   		log("Hello, World!")
        log(signer.address)
        // if the account doesn't already have a collection
        if signer.borrow<&MercuryItems.Collection>(from: MercuryItems.CollectionStoragePath) == nil {

            // create a new empty collection
            let collection <- MercuryItems.createEmptyCollection()
            
            // save it to the account
            signer.save(<-collection, to: MercuryItems.CollectionStoragePath)

            // create a public capability for the collection
            signer.link<&MercuryItems.Collection{NonFungibleToken.CollectionPublic, MercuryItems.MercuryItemsCollectionPublic}>(MercuryItems.CollectionPublicPath, target: MercuryItems.CollectionStoragePath)
        }
    }
}
