pragma solidity ^0.8.4;

contract Events {
    
    mapping(address => uint) tokenBalance;
    
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor() {
        tokenBalance[msg.sender] = 100;
    }
    
    function sendToken(address _to, uint _amount) public {
        emit TokensSent(msg.sender, _to, _amount);
    }
    
}