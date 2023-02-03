pragma solidity ^0.8.1;

contract Students {    
    address private admin_adress;

    struct Student{
        string name;  
        uint8 age;
        string gender; 
    }

    mapping (uint256 => Student) public students;

    constructor() {                 
           admin_adress = msg.sender;
    } 

    function store_details(string calldata _name , uint8 _age , string calldata _gender) external{
        uint256 id = students.length;
        students[id].name = _name;
        students[id].age = _age;
        students[id].gender = _gender;
    }

    function getstudent(string memory _name) public view returns(string memory __name , uint8 _age , string memory _gender){
        for (uint256 i = 0; i < students.length; i++) {
            if (students[i].name == _name) {
                __name = students[i].name;
                _age = students[i].age;
                _gender = students[i].gender;
                return;
            }
        }
        require(false, "student not found");
    }

    function getallstudents() public view returns(string memory) {
        string memory output="";
        for (uint256 i = 0; i < students.length; i++) {
            output = string(abi.encode(output,"[", students[i].age, ",", students[i].name, ",", students[i].gender, "]"));
        }
        return output;
    }

    function deletestudent(string memory _name) public returns(string memory _gender , uint8 _age){
        require(msg.sender == admin_adress , "not authorized");

        for (uint256 i = 0; i < students.length; i++) {
            if (students[i].name == _name) {
                _gender = students[i].gender;
                _age = students[i].age;
                delete students[i];
                return;
            }
        }
        require(false, "student not found");
    }
}
