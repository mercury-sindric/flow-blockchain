import MercuryItems from "../../contracts/MercuryItems.cdc"

// This scripts returns the number of MercuryItems currently in existence.

pub fun main(): UInt64 {    
    return MercuryItems.totalSupply
}
