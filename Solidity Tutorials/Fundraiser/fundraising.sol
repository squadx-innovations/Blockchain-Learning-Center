pragma solidity 0.4.23;

contract FundRaising {
    address owner = 0xfAD8c713531d81646bf9Dc3Af4D61493a3176e5a;
    uint public total = 0;
    
    modifier ownerOnly() {
        require(msg.sender == owner,"You must be owner");
        _;
    }
    
    //add funds
    function add() payable public {
        require(msg.value > 0, "You need to send some ether");
        total += msg.value;
    }
    
    //only onwer can withdraw funds
    function withdrawOwner() public ownerOnly {
        owner.transfer(address(this).balance);
        total = 0;
        assert(this.balance == total);
    }
    
    //total funds collected
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
