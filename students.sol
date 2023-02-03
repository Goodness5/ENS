// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;

contract Students {    
    address private admin_adress;

    struct Student{
        uint256 id;
        string name;
        uint8 age;
        string gender; 
    }

    mapping (uint256 => Student) public students;

    // Student student;
     
    uint256 id = 0;

    constructor() {                 
           admin_adress = msg.sender;
    } 

    function store_details(string calldata _name , uint8 _age , string calldata _gender) external{
        id = Students.id;
        students[id].name = _name;
        students[id].age = _age;
        students[id].gender = _gender;
        id++;

    }

    function getstudent(string memory _name) public view returns(string memory __name , uint8 _age , string memory _gender){
        // for (uint256 i = 0; i < studentscount; i++) {
            if (keccak256(abi.encodePacked(students[id].name)) == keccak256(abi.encodePacked(_name))) {
                __name = students[id].name;
                _age = students[id].age;
                _gender = students[id].gender;
            // }
        }
        // return student;
        require(false, "student not found");
    }

    function getallstudents() public view returns(string memory) {
        string memory output="";
        // for (uint256 i = 0; i < students.length; i++) {
            output = string(abi.encode(output,"[", students[id].age, ",", students[id].name, ",", students[id].gender, "]"));
        // }
        return (output);
    }

    function deletestudent(string memory _name) public returns(string memory _gender , uint8 _age){
        require(msg.sender == admin_adress , "not authorized");

        // for (uint256 i = 0; i < studentscount; i++) {
            if (keccak256(abi.encodePacked(students[id].name)) == keccak256(abi.encodePacked(_name))) {
                _gender = students[id].gender;
                _age = students[id].age;
                delete students[id];
                // return Student;
            }
        // }
        require(false, "student not found");
    }
}
