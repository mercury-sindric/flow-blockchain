import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import MercuryItems from "../../contracts/MercuryItems.cdc"

// This script returns the metadata for an NFT in an account's collection.

pub fun main(address: Address, itemID: UInt64): UInt64 {

    // get the public account object for the token owner
    let owner = getAccount(address)

    let collectionBorrow = owner.getCapability(MercuryItems.CollectionPublicPath)!
        .borrow<&{MercuryItems.MercuryItemsCollectionPublic}>()
        ?? panic("Could not borrow MercuryItemsCollectionPublic")

    // borrow a reference to a specific NFT in the collection
    let MercuryItem = collectionBorrow.borrowMercuryItem(id: itemID)
        ?? panic("No such itemID in that collection")

    return MercuryItem.typeID
}
