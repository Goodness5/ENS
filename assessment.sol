// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;



/**
Write a   contract that deposit fund into a contract. And also keep track of funds transferred into the contract. 
Add a function to the balance of address that have deposited into the contract.(Submit Github gist)
 */

contract Fund{
    mapping (address => uint256) public balances;
    uint256 public totalSupply;
    // uint256 public val;

    function deposit(uint256 _val) public payable {
        _val = msg.value;
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
    
    }

    function getBalance(address _address) public view returns (uint256) {
        return balances[_address];
    }
}

/** 
THE FALLBACK FUNCTION IS A FUNCTION THAT EXECUTES WHEN A CONTRACT RECEIVES FUNDS IN A SMART CONTRACT BUT HAS NO RECEIVE FUNCTION
PRESENT IN THE CONTRACT
*/