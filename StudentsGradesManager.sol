pragma solidity 0.8.4;

contract StudentsGradesManagement {
    
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    struct Grade {
        string subject;
        uint grade;
        uint factor;
    }
    
    struct Student {
        string firstName;
        string lastName;
        mapping(uint => Grade) grades;
        uint numberOfGrades;
    }
    
    mapping(address => Student) students;
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'Not the owner');
        _;
    }
    
    function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public onlyOwner {
        bytes memory testFirstNameStudent = bytes(students[_studentAddress].firstName);
        require(testFirstNameStudent.length == 0, "This student already exists");
        students[_studentAddress].firstName = _firstName;
        students[_studentAddress].lastName = _lastName;
        students[_studentAddress].numberOfGrades = 0;
    }
    
    function addGrade(address _studentAddress, string memory _subject, uint _grade, uint _factor) public onlyOwner {
        bytes memory testFirstNameStudent = bytes(students[_studentAddress].firstName);
        require(testFirstNameStudent.length != 0, "You have to create the student first");
        Grade memory thisGrade = Grade(_subject, _grade, _factor);
        students[_studentAddress].grades[students[_studentAddress].numberOfGrades] = thisGrade;
        students[_studentAddress].numberOfGrades++;
    }
    
    function getAverageGradeByAddress(address _studentAddress) public onlyOwner view returns(uint) {
        uint total = 0;
        uint totalFactor = 0;
        uint numberOfGrades = students[_studentAddress].numberOfGrades;
        for(uint i = 0 ; i < numberOfGrades ; i++) {
            total += students[_studentAddress].grades[i].grade * students[_studentAddress].grades[i].factor;
            totalFactor += students[_studentAddress].grades[i].factor;
        }
        return total / totalFactor;
    }
    
}