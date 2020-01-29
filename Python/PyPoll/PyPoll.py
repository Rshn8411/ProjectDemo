"""
PyPoll assignment
"""
import os
import csv

election_csv = os.path.join("Resources","election_data.csv") # set pathway

with open(election_csv, newline="") as csvfile: #open file
    csvReader = csv.reader(csvfile, delimiter=",") # initialize the reader
    csv_header = next(csvReader) # skip header

    vote_count = 0 #variable for counting votes
    candidates = {} #initialize empty dictionary for election resuls

# Begin For Loop to count votes
    for row in csvReader:
        vote_count +=1 #count total votes
        if row[2] in candidates: #if the name exists in the dictionary then...
            candidates[row[2]] += 1 #add one to the value (as another vote)
        else: #dictionary starts off empty so first name will always be added
            candidates[row[2]] = 1 #start name off with one vote as the value

    winner = max(candidates, key=candidates.get) #find the Max value of the dictionary

# Print the results to the terminal
    print("Election Results \n")
    print("Total Votes: " + str(vote_count))
    print("\n---------------------")
    #Iterate through the candidates and calculate their percentage (value/total)
    #Then print the name: percentage (and total)
    for key in candidates:
        percent = round((candidates[key]/vote_count)*100,2)
        print(f"{key} : {percent}% ({candidates[key]})")
    print("\n---------------------")
    print(f"Winner: {winner}") #print the winner

#Output to text file to results.txt - same process as above only writing to .txt
    results_file = open('results.txt','w')
    results_file.write("Election Results \n")
    results_file.write("Total Votes: " + str(vote_count))
    results_file.write("\n---------------------\n")
    for key in candidates:
        percent = round((candidates[key]/vote_count)*100,2)
        results_file.write(f"{key} : {percent}% ({candidates[key]})\n")
    results_file.close()
