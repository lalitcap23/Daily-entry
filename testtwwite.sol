// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;




contract User   {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        require(players[userAddress].playerAddress == address(0), "User already exists with this address");

        Player memory newPlayer = Player({
            playerAddress: userAddress,
            username: username,
            score: 0
        });

        players[userAddress] = newPlayer;
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

    event TweetCreated(uint256 id, address author, string content, uint256 timestamp);
    event TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 likeCount);
    event TweetUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    mapping(address => Tweet[]) public tweets;

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        maxTweetLength = newTweetLength;
    }

    function getTotalLikes(address _author) public view returns (uint256) {
        uint256 totalLikes = 0;
        for (uint256 i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }
        return totalLikes;
    }

    function makeTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= maxTweetLength, "Tweet exceeds maximum length");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
        emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author].length > id, "Tweet does not exist");
        tweets[author][id].likes++;
        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author].length > id, "Tweet does not exist");
        require(tweets[author][id].likes > 0, "No likes to remove");
        tweets[author][id].likes--;
        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes);
    }

    function getTweet(address _owner, uint256 index) public view returns (Tweet memory) {
        require(tweets[_owner].length > index, "Tweet does not exist");
        return tweets[_owner][index];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}

