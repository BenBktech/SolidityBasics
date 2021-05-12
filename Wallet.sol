pragma solidity 0.8.4;

contract MappingStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totalBalance >= _amount, 'Not enought funds');
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
    
    receive() external payable {
        Payment memory thisPayment = Payment(msg.value, block.timestamp);
        balanceReceived[msg.sender].totalBalance += msg.value;
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = thisPayment;
        balanceReceived[msg.sender].numPayments++;
    }
    
    fallback() external payable {
        
    }
    
}