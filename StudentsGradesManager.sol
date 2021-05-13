pragma solidity 0.8.4;

contract StudentsGradesManagement {
    
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    struct Grade {
        string subject;
        uint grade;
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
        students[_studentAddress].firstName = _firstName;
        students[_studentAddress].lastName = _lastName;
        students[_studentAddress].numberOfGrades = 0;
    }
    
    function addGrade(address _studentAddress, string memory _subject, uint _grade) public onlyOwner {
        Grade memory thisGrade = Grade(_subject, _grade);
        students[_studentAddress].grades[students[_studentAddress].numberOfGrades] = thisGrade;
        students[_studentAddress].numberOfGrades++;
    }
    
    function getAverageGradeByAddress(address _studentAddress) public onlyOwner view returns(uint) {
        uint total = 0;
        uint numberOfGrades = students[_studentAddress].numberOfGrades;
        for(uint i = 0 ; i < numberOfGrades ; i++) {
            total += students[_studentAddress].grades[i].grade;
        }
        return total / numberOfGrades;
    }
    
}