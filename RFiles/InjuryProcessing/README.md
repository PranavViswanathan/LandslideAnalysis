# R File explaination

**Lines 1 - 3:**<br> Reading the data. The path variable points to the location of the file on the device. The content variable is used to store the dataframe created by the read.csv() function<br>

**Lines 5 - 8:**<br> The objective of this file is to plot and understand the number of injuries for each kind of landslide type. For this, only 5 of the 31 columns have been taken into consideration.<br>

**Lines 10 - 12:**<br> Removing the null values from the dataset.<br>

**Lines 14 - 25:**<br> Creating empty vectors to store the fatalities for each landslide type<br>

**Lines 27 - 56:**<br> Adding the injuries to the respective fatalitiy vectors<br>

**Lines 58 - 69:**<br> Finding the total number of injuries per landslide event<br>

**Lines 71 - 77:**<br> Ploting the bar graph<br>
