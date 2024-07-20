
// SPDX-License-Identifier: MIT
// Software Package Data Exchange
pragma solidity ^0.8.26;

contract TweetStorage {
    // Defining struct with author, content, times etc  etc [ finially  sara kam kardiya hmm]
    uint16 public  MAx_tweet_Length=280;
        struct Tweet {
        uint256 id;        
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    address public owner;
    constructor(){
        owner =msg.sender;  
    }
    modifier onlyowner(){
        require(msg.sender== owner ,"hi , dude you are not the ower jerk off " );
        _;
    }
    // Mapping to store tweets associated with addresses
    mapping(address => Tweet[]) public tweets;
    function changetweetlength(uint16 newTweetlength)public  onlyowner{
  MAx_tweet_Length= newTweetlength;
    }
    function makeTweet(string memory _tweet) public {
    require(bytes(_tweet).length <= MAx_tweet_Length, "tweet kafi hateful lag rha hai so can't allow ");  

        Tweet memory newTweet = Tweet({
            id : tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }
function liketweet(address author, uint256 id )external {
    require(tweets[author][id].id==id ,"tweet to hain ab kya ");
    tweets[author][id].likes++;
}
function unliketweet( address author, uint256 id )external {
    require(tweets[author][id].id== id,"tweet doesn't exist");
    require(tweets[author][id].likes>0,"tweets are useless");
    tweets[author][id].likes--; 
}
    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
