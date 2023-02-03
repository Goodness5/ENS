// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

contract Name {
    
    address public aaddress;
    string public name;

     event Logregister(string newName, address indexed sender);
      event Logdetails(string newName, address indexed sender);
       event LogChangeName(string newName, address indexed sender);
        event Logcheckowner(address indexed sender);


    modifier validityCheck(address __address){
            __address = msg.sender;
        require(__address != address(0));

        _;
    }

    function register(string memory _name ) public {

        name = _name;
        aaddress = msg.sender;

        require(keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked(_name)) , "namespace taken");
        require(aaddress != address(0) , "address is registered");

        emit Logregister(_name , msg.sender);
    }
    function details() public returns(string memory owner, address _aaddress){
            owner = name;
            _aaddress = aaddress;

            emit Logdetails(name , msg.sender);

    }
   function changeName(string memory ___name) public validityCheck(msg.sender){
        name = ___name;
    // __address = msg.sender;
     emit LogChangeName(___name, msg.sender);
}

    function checkOwner(string memory __name) public returns (string memory owner, address _aaddress){
        require(keccak256(abi.encodePacked(__name)) == keccak256(abi.encodePacked(name)), "person not registered");
            owner = name;
            _aaddress = aaddress;

            emit Logcheckowner(msg.sender);
}

}