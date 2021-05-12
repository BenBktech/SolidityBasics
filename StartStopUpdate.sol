pragma solidity 0.8.4;

contract StartStopUpdateExample {
    
    address owner;
    
    bool public paused;
    
    constructor() {
        owner = msg.sender;
    }
    
    fallback() external payable {
        // custom function code
    }

    receive() external payable {
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, 'You are not the owner');
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, 'Not the owner');
        require(!paused, 'Contract is paused');
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public {
        require(owner == msg.sender, 'Not the owner');
        selfdestruct(_to);
    }

}