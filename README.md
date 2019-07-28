# Blockchain-election

We are going to address two problems: making EVMs hack-proof and more believable, and instantaneous counting of votes.

Our Blockchain will contain a dictionary of data, and a hash of the previous block, and the hash of both of the above. The dictionary will contain a hash of the voter ID(so that the authorities may check later on with their lists if needed, but normal people can't, thus keeping the anonymity) another dictionary of party names in the constituency along with the number of votes and a timestamp in floating point numbers. Each individual 'block' as above, gets stored sequentially in an array.

Each press of the button does the following steps:
1) logs in the timestamp
2)gets the array of parties and votes and adds one to whichever button is pressed. 
3)hashes in the ID of the user that the volenteer has put in, and completes the data part. 
4) the data, along with the previous Hash are hashed again, and the new node is formed and stored. 

As a security measure, all buttons of the EVM are freezed for a minute after each pressing. If the user has mispressed, the latest block just can be deleted. This is a safe process, since it can happen for one time, and to prevent misuse of even this one vote, we can take extensive signatures from the voter before he does so.

The timestamp of every vote is also sent to government servers so that they can be checked in case of discrepancies.
<br><br>



After Voting is done for a particular constetuency, a quick backtracking is done to check the integrity of the results or if it has been tampered with. If it has not been, then the results can be found out directly from the latest node. Hence, we get immediate results, and releasing them is at the discretion of EC.
