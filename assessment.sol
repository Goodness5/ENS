// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;



/**
Write a   contract that deposit fund into a contract. And also keep track of funds transferred into the contract. 
Add a function to the balance of address that have deposited into the contract.(Submit Github gist)
 */


pragma solidity ^0.8.1;

contract DepositFunds {
    mapping (address => uint256) public balances;
    uint256 public totalSupply;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
    }

    function getBalance(address _address) public view returns (uint256) {
        return balances[_address];
    }
}
