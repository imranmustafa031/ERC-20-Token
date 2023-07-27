const { expect } = require("chai");

describe("KryptoShark Contract", function () {
  let hardhatToken;
  let owner;
  let addr1;
  let addr2;
  let addr3;
  beforeEach(async function () {
    [owner, addr1, addr2, addr3] = await ethers.getSigners();
    hardhatToken = await ethers.deployContract("KryptoShark");
  });

  describe("Deployment", async function () {
    it("Total Supply Check", async function () {
      const totalcoin = await hardhatToken._totalSupply();
      expect(await hardhatToken.balanceOf(owner.address)).to.equal(totalcoin);
    });

    it("Transfer Check", async function () {
      const transferCoin = await hardhatToken.transfer(addr1.address, 100);
      expect(await hardhatToken.balanceOf(addr1.address)).to.equal(100);
    });
    it("Allowance and Approve", async function () {
      await hardhatToken.approve(addr2.address, 100);
      expect(
        await hardhatToken.allowance(owner.address, addr2.address)
      ).to.equal(100);
    });
    it("TransferFrom Check", async function () {
      const transferCoin = await hardhatToken.approve(addr2.address, 100);
      expect(
        await hardhatToken.allowance(owner.address, addr2.address)
      ).to.equal(100);
      await hardhatToken
        .connect(addr2)
        .transferFrom(owner.address, addr3.address, 50);
      expect(
        await hardhatToken.allowance(owner.address, addr2.address)
      ).to.equal(50);

      expect(await hardhatToken.balanceOf(addr3.address)).to.equal(50);
    });
  });
});
