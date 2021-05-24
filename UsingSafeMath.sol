pragma solidity ^0.8.4;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';

contract UsingSafeMath {
    
    uint number;
    
    using SafeMath for uint;
    
    function addTest(uint _amount) public {
        number = number.add(_amount);
    }
    
    function getNumber() public view returns(uint) {
        return number;
    }
    
}