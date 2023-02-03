// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

contract Students {    
    address private admin_adress;

    struct Student{
        string name;  
        uint8 age;
        string gender; 
    }

    Student student;

    mapping (uint256 => Student) public students;
 
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

            _name = student.name;

        require(keccak256(abi.encode(_name)) == keccak256(abi.encodePacked(student.name)) , "student not found");

    }

   function getallstudents() public view returns(string memory) {
    string memory output="";
    for (uint i = 0; i == student.age; i++) {
        output = string(abi.encode(output,"[", students[i].age, ",", students[i].name, ",", students[i].gender, "]"));
    }
    return output;
}

    function deletestudent(string memory _name) public returns(string memory _gender , uint8 _age){

        _name = student.name;

        // details = 
        // _name = student.name ,
        // _gender = student.gender ,
        // _age = student.age;
        require(msg.sender == admin_adress , "not authorised");
        require(keccak256(abi.encode(_name)) == keccak256(abi.encodePacked(student.name)) , "student not found");
        delete student.name;
        delete student.gender;
        delete student.age;
        
    }
}