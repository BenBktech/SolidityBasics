pragma solidity 0.8.4;


contract Variables {
    
    uint256 public myUint;
    bool public myBool;
    uint8 public myUint8;
    address public myAddress;
    string public myString = "";
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    function increment() public {
        myUint8++;
    }
    
    function decrement() public {
        myUint8--;
    }
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalance(address _address) public view returns(uint) {
        return _address.balance;
    }
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }

}