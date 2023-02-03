// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

contract Student {    
    address private admin_adress;

    struct student{
        string name;  
        uint8 age;
        string gender; 
    }
 
    constructor() {                 
           admin_adress = msg.sender;
        //    msg.sender = owner;
               
    } 

    function store_details(string memory _name , uint8 _age , string memory _gender) external{

            _name = student.name;
            _age = student.age;
            _gender = student.gender;

    }

    function getstudent(string memory _name) public view returns(string memory __name , uint8 _age , string memory _gender){

        require(keccak256(abi.encode(_name)) == keccak256(abi.encodePacked(student.name)) , "student not found");

    }
}