import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import MercuryItems from "../../contracts/MercuryItems.cdc"

// This script returns the size of an account's MercuryItems collection.

pub fun main(address: Address): Int {
    let account = getAccount(address)

    let collectionRef = account.getCapability(MercuryItems.CollectionPublicPath)!
        .borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs().length
}
