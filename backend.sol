// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract User {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        require(players[userAddress].playerAddress == address(0), "User already exists with this address");
        require(userAddress != address(0), "Invalid address");

        players[userAddress] = Player({
            playerAddress: userAddress,
            username: username,
            score: 0
        });
    }
}

contract TweetStorage is User {
    uint16 public maxTweetLength = 280; // Maximum length of a tweet
    address public owner;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    event TweetCreated(uint256 id, address indexed author, string content, uint256 timestamp);
    event TweetLiked(address indexed liker, address indexed tweetAuthor, uint256 tweetId, uint256 likeCount);
    event TweetUnliked(address indexed unliker, address indexed tweetAuthor, uint256 tweetId, uint256 newLikeCount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    mapping(address => Tweet[]) public tweets;

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        require(newTweetLength > 0, "Tweet length must be greater than 0");
        maxTweetLength = newTweetLength;
    }

    function getTotalLikes(address _author) public view returns (uint256 totalLikes) {
        for (uint256 i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }
    }

    function makeT
