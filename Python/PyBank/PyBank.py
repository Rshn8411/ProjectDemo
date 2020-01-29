"""
PyBank assignment
"""
import os
import csv

budget_csv = os.path.join("Resources","budget_data.csv") # set pathway

with open(budget_csv, newline="") as csvfile: #open file
    csvReader = csv.reader(csvfile, delimiter=",")
    csv_header = next(csvReader) # skip header

    prof_loss_list = [] # empty list to append to and find Max and Min
    date_list = [] # empty list to store dates to pull for the Max and Min
    rowTotal = 0.0 # initialize rowTotal variable as float
    countMonths = 0 #count number of months

    for row in csvReader: #loop through each row
        rowTotal = float(row[1])+rowTotal #increment and
        countMonths += 1 # Counter for the number of months
        prof_loss_list.append(int(row[1])) #Append row[1] profit/loss to list
        date_list.append(row[0]) #Append the date to list

    averageProf_Los = rowTotal/countMonths #calculate average of profit vs loss
    greatestIncrease = max(prof_loss_list) #Find the greatest profit
    greatestDecrease = min(prof_loss_list) #Find the greatest loss

    month_highest = prof_loss_list.index(greatestIncrease) #Index the year of greatest profit
    month_lowest = prof_loss_list.index(greatestDecrease) #Index the year of the greatest loss


# General output
    print("Total number of Months: " + str(countMonths))
    #print(countMonths)
    print("Cumulative Row Total: " + str(rowTotal))
    #print(rowTotal)
    print("Average Profit/Loss: " + str(round(averageProf_Los,2)))
    #print(round(averageProf_Los,2))
    print("Greatest Increase in profit for " + date_list[month_highest] + ": " + str(greatestIncrease))
    #print(greatestIncrease)
    print("Greatest Decrease in profit for " + date_list[month_lowest] + ": " + str(greatestDecrease))
    #print(greatestDecrease)

    txt_output = open('output.txt','w')
    txt_output.write("Total number of Months: " + str(countMonths))
    #write(countMonths)
    txt_output.write("\nCumulative Row Total: " + str(rowTotal))
    #write(rowTotal)
    txt_output.write("\nAverage Profit/Loss: " + str(round(averageProf_Los,2)))
    #write(round(averageProf_Los,2))
    txt_output.write("\nGreatest Increase in profit for " + date_list[month_highest] + ": " + str(greatestIncrease))
    #write(greatestIncrease)
    txt_output.write("\nGreatest Decrease in profit for " + date_list[month_lowest] + ": " + str(greatestDecrease))
    #write(greatestDecrease)
    txt_output.close()
