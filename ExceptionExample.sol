pragma solidity ^0.8.4;

contract ExceptionExample {
    
    mapping(address => uint) public balanceReceived;
    
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(payable(owner));
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "you don't have enough ether!");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    receive() external payable {
        assert(balanceReceived[msg.sender] + uint(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint(msg.value);
    }
    
    fallback() external payable {
        
    }
    
}