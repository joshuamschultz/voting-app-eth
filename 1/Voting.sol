pragma solidity >=0.4.0 <0.6.0;

// contract is like declaring a class

contract Voting {

    mapping (bytes32 => uint256) public votesReceived;

    // mapping is like creating a hash. Here is is public
    // and so can be viewed from outside the contact by 
    // requesting votesReceived.

    bytes32[] public candidateList;

    // here we declared a public array to which we will 
    // add a list of candidates.

    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }

    // a constructor is like an initialization method. It is only
    // called on creation and cant be changed again. This is due to
    // the blockchain being immutable.

    // in this case we are taking the input array of names and 
    // assigning it to the candidateList array in our contract.

    function totalVotesFor(bytes32 candidate) view public returns (uint256) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    // This function is only for reading or viewing. So we declare it as a vew.
    // it also returns a value, in this case the count. It only does this for valid
    // candidates.

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    // This function increments the vote count for the candidate passed as 
    // long as validCandidate is true. You cant vote for people not on the list.

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }

        return false;
    }

    // the above is a for loop which goes through the candidate list to see if the
    // passed candidate is on the list. Once it hits it, it returns true. If it never
    // hits it, it goes to the end of the function and returns false.


}
