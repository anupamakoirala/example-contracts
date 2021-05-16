pragma solidity ^0.6.4;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        uint256 cityId;
        //you can add city details if you want
    }


    mapping(uint256 => City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    address voter;
    uint256 public cityCount = 0; // number of city added
    
    constructor() public {
    cityCount ++;

    //TODO set contract caller as owner
    
    owner = msg.sender;

    //TODO set some intitial cities.
    cities[cityCount].cityName = "Pokhara";
    cities[cityCount].vote = 0;
    cities[cityCount].cityId = cityCount;
      
    }
 
 
    function addCity(string memory name) public {
      //  TODO: add city to the CityStruct
      require(msg.sender == owner,"Only owner can add the city ");
      cityCount ++;
      cities[cityCount].cityName = name;
      cities[cityCount].vote = 0;
      

    }
    
    function vote(uint256 cityid) public {
        voter = msg.sender;
        require(hasVoted[voter] != true,"ALready voted");
        cities[cityid].vote ++;
        hasVoted[voter] = true;
        //TODO Vote the selected city through cityID
        

    }
    function getCity(uint256 cityid) public view returns (string memory) {
        return (cities[cityid].cityName);
     // TODO get the city details through cityID
    }
    function getVote(uint256 cityid ) public view returns (uint256) {
        return cities[cityid].vote;
        
    // TODO get the vote of the city with its ID
    }
}