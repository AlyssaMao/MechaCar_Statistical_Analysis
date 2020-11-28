#Use the library()function to load the dplyr package
library("dplyr")

#Import and read in the MechaCar_mpg.csv file as a dataframe
mecha<-read.csv(file="MechaCar_mpg.csv")

#Perform linear regression using the lm() function. In the lm() function, pass in all six variables
#and add the data frame you created in step 4 as the data parameter
lm(mpg~vehicle_length+vehicle_weight+ground_clearance+spoiler_angle+AWD, data =mecha)

#Using the summary() function, determine the p value and r squared value for the linear regression model
summary(lm(mpg~vehicle_length+vehicle_weight+ground_clearance+spoiler_angle+AWD, data =mecha))

#Save your MechaCarChallenge.Rscript file to your Github Repository
#Deliverable 2
#In your MechaCarChallenge.Rscript, import and read in the suspension_coil.csv file as a table
sus<-read.csv(file="Suspension_Coil.csv",check.names=F)

#Write an Rscript that creates a total_summary dataframe using the summarize() function to get the mean media variance
#and standard deviation of the suspension coil's PSI column
total_summary <- sus %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Write an Rscript that creates a lot_summary dataframe using the group_by() and summarize() function
#to group each manufacturing lot by the mean media variance and standard dev of the sus coil's psi column
lot_summary <- sus %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Deliverable 3
#write Rscript using t.test() function to determine if PSI across all maufacturing lots is statistically diff from 
#population mean of 1,500 lbs per square inch
t.test(sus$PSI,mu=1500)

#write 3 more Rscripts using t.test() and subset() argument to determine if the PSI for each manufacturing lot
#is statistically different from the population mean of 1.5k lbs per sq inch
lot1<- subset(sus, Manufacturing_Lot=="Lot1")
t.test(lot1$PSI, mu=1500)
lot2<- subset(sus, Manufacturing_Lot=="Lot2")
t.test(lot2$PSI, mu=1500)
lot3<- subset(sus, Manufacturing_Lot=="Lot3")
t.test(lot3$PSI, mu=1500)