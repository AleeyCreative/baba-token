var BabaToken = artifaces.require("./BabaToken.sol")

contract("BabaToken", function(accounts) {
    var tokenInstance
    it("Initialises the token with the correct token", function() {
        return BabaToken.deployed().then(instance => {
            tokenInstance = instance
            return tokenInstance.name()
        }).then(name => {
            assert.equal(name, "Baba Token", "It renders the name correctly")
            return tokenInstance.symbol()
        }).then(symbol => {
            assert.equal(symbol, "BBT", "It renders the correct symbol")
            return tokenInstance.standard()
    }).then(standard => {
        assert.equal(standard, "BabaToken 1.0.0", "It renders the correct standard")
    })
    })

    it("Allocates the correct initial supply upon deployment", function() {
        var tokenInstance
        return BabaToken.deployed().then(instance => {
            tokenInstance = instance
            return tokenInstance.totalStatus()
        }).then(totalStatus =>{
            assert.equal(totalStatus.toNumber(), 10000, "Allocates initial supply correctly")
            return tokenInstance.balanceof[accounts[9]]
        }).then(adminAccount => {
            assert.equal(adminAccount.toNumber(), 1000, "Allocates the correct admin amount upon deployment")
        })
    })
})