//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract simpleStorage{
    uint256 public favoriteNumber;

function store(uint256 _favoriteNumber) public{
    favoriteNumber = _favoriteNumber;
}
//view and pure functions don't hange state of blockchain and hence are blue buttons
//pure fxn used for arthimetic equations where result isnt stored anywhere
function retrieve() public view returns(uint256){
    return favoriteNumber;

}
struct People{
    uint256 favoriteNumber;
    string Name;
}
//People public person = People({favoriteNumber: 2, Name: "Pat"});

People[] public people;
mapping(string => uint256) public nameToFavoriteNumber;


function addPerson(string memory _name,uint256 _favoriteNumber) public
{
    people.push(People(_favoriteNumber,_name));
    nameToFavoriteNumber[_name]= _favoriteNumber;
}
}