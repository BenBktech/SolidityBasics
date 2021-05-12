pragma solidity ^0.8.4;

contract SendMoneyExample {
    
    uint public balanceReceived;
    
    fallback() external payable {
        // custom function code
    }

    receive() external payable {
        balanceReceived += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
    
}