pragma solidity 0.4.25;

contrac {
    //Different States in the blockchain
    enum StateType {Setup, Voting, Result}
    //State Variables.
    StateType public State;
    struct Candidate {
        int id;
        string name;
        int voteCount;
    }

    address public chairperson;
    address public Voter;
    
    mapping(address => bool) public voters;
   
    mapping(int => Candidate) public candidates;
   
    int public CandidatesCount;
    string public winner;
    string public cname;
    int public candidateId;
    string public Title;

    //Constructor for the contract.
    constructor (string title) public {
        //Initializing all the variables and setting up for Voting.
        Title = title;
        CandidatesCount = -1;
        AddCandidate("NOTA");
        State = StateType.Setup;
    }

    function vote (int candidateId) public {
        //To stop the voter from voting twice
        require(!voters[msg.sender], "You are not Permitted to vote Twice.");

        //To stop the user from voting to an Invalid Candidate(#TODO GUI modification).
        require(candidateId > 0 && candidateId <= CandidatesCount, "Invalid Candidate.");

        //Setting the voted flag.
        voters[msg.sender] = true;

        //Adding the vote to the candidate.
        candidates[candidateId].voteCount ++;

        //Setting the next state.
        State = StateType.Voting;
    }

    //Function to add a new candidate to the election.

    function AddCandidate (string cname) public {
        CandidatesCount ++;
        candidates[CandidatesCount] = Candidate(CandidatesCount, cname, 0);
    }

    function CalcWinner () public {
        int maxVotes = 0;
        for (int i = 0; i <= CandidatesCount; i++){
            if (candidates[i].voteCount > maxVotes){
                winner = candidates[i].name;
                maxVotes = candidates[i].voteCount;
            }
        }
        State = StateType.Result;
    }

    function AllowVoting () public {
        State = StateType.Voting;
    }
}