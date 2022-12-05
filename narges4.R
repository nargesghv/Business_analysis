
#MSE course: Analysis of Sequential Data
#Giorgio Corani 
#This function shows some basic R commands 

#In Rstudio, you run a chosen line by placing there the cursor 
#ctrl+return (command + return on MacOS) 

# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check value and class of my_numeric in console
my_numeric
class(my_numeric)
#type

#In R, you create a vector with the combine function c(). 
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")


#sum of vectors works elementwise
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the element-wise sum of A_vector and B_vector
total_vector <- A_vector + B_vector 
total_vector

# Print out total_vector  
total_vector #5 7 9

#selection of elements from a vector
#To select multiple elements from a vector, you can add square brackets at the end of it. 
#You can indicate between the brackets what elements should be selected. 

#For example: suppose you want to select the first element of A_vector:
A_vector[1] #1
B_vector[2] #5

#first and second element of B_vector
idx <- c(1,2)
B_vector[idx]
#use vector as index
#more commonly:
B_vector[c(1,2)]

#getting a sequence of elements is done via the colon (":") operator 
B_vector[1:2]#get element 1 and 2
B_vector[1:3]#get element 1, 2 and 3
B_vector[-1]#get all elements avoiding the first one

#selection of element of a matrix
myMatrix <- matrix(data=c(1,2,3,4,5,6), nrow=2, ncol = 3)
#plot the matrix in console
myMatrix 

#select the element in position 1,1
myMatrix[1,1] #1

#select the first row (the empty index after the comma select the entire row)
myMatrix[1,] #1 3 5

#select the second column
myMatrix[,2] #3 4

#setting the name of columns
colnames(myMatrix) <- c("first_col","second_col","third_col")

#accessing a column using its name.
myMatrix[,"second_col"]

#tools and data sets for time series analysis


#if the library is not present on your system, you can install it
#by typing:



#the  lines below follow the slides of "time series graphics"
#accessing the time series objects
#?ausbeer provides information about the quarterly data set ausbeer
?ausbeer 
ausbeer[1:10] #data of the first ten quarters

#check that ausbeer is a time series object
class(ausbeer)#ts

frequency(ausbeer)#this a quarterly time series
#4

#a better way to extract part of a time series is to use the window function, which 
#select both the values and the associated time. We need to specify start (default: first value of the time 
#series) and end (default: last value of the time series)

#select data from the second quarter of 1990
ausbeerSince1990 <- window(ausbeer, start=c(1990,2))

#select data up to  the fourth quarter of 1995
ausbeerUpTo1995 <- window(ausbeer, end=c(1995,4))

#produce a nice plot
autoplot(ausbeer)

#easy to customize with labels and title
autoplot(ausbeer) + ggtitle("Australian beer sales") + ylab("Sales") + xlab("Years")

#arrivals is a quarterly multiple time series, i.e. it contains quarterly arrivals 
#for different countries ("UK","NZ","Japan","US")

#autoplot by default plots the four time series together
autoplot(arrivals)
ggsubseriesplot("Japan")

#you can get a separate plot for each time series by specifying facets = TRUE
autoplot(arrivals, facets = TRUE)

#if you wanna plot only Japan: first select Japan from arrivals
#you select the whole time series of Japan as follows:
japan  <- arrivals[,"Japan"] #we select a column by its name 
autoplot(japan)  + ggtitle("Japan") + xlab("Years") + ylab("Arrivals")
??ausgdp
library(fpp2)
autoplot(dole) + ggtitle("million") + ylab("year")
autoplot(goog) + ggtitle("Australian beer sales") + ylab("Sales")
install.packages("Mcomp")
library(Mcomp)
time_series<-quarterly_ts_list[[703]]$x
quarterly_ts_list <- subset(M3,"quarterly")
quarterly_ts_list <- subset(M3,"quarterly")
time_series<-quarterly_ts_list [[703]]$x
time_series
autoplot(time_series)
fit1<-naive(time_series,h=20)
fit2<-ses(time_series,h=20)
fit3<-ses(time_series,h=20)
Future_data<-quarterly_ts_list [[703]]$xx
Future_data
library()
acc<-residuals(fit1)
checkresiduals(fc)
accuracy(fit2,Future_data)
accuracy(fc,Future_data)
residuals(fit1)
summary(fc)
summary(fit9)
autoplot(fit9)
summary(acc)
acf(time_series)
pacf(time_series)
fit4<-hw(time_series,h=20)
fit4<-holt(time_series,h=20)
fit6<-holt(time_series,h=20,damped = TRUE)
fit7<-hw(time_series,damped = TRUE,seasonal = "additive")
fit8<-hw(time_series,damped = FALSE,seasonal = "multiplicative")
fit9<-hw(time_series,damped = TRUE,seasonal = "multiplicative")
fit10<-hw(time_series,damped = FALSE,seasonal = "additive")
coef(fit9)
fit <- auto.arima(time_series)
rd<-residuals(fit)
summary(rd)
autoplot(rd)
forecast_arima<-forecast(fit,h=10)
autoplot(forecast_arima)
accuracy(forecast_arima,Future_data)
ndiffs(time_series)
e1 <- tsCV(time_series,hw,damped=TRUE,seasonal="multiplicative",h=1)
mean(e1^2, na.rm=TRUE)
mean(abs(e1), na.rm=TRUE)
autoplot(time_series)+autolayer(fit10, series="HW additive forecasts", PI=FALSE) +autolayer(fit8, series="HW multiplicative forecasts",PI=FALSE) +xlab("Year") +ylab("amount") +ggtitle("all forecast") +guides(colour=guide_legend(title="Forecast"))
autoplot(fit4)
fit1<-ets(time_series, model="AAA", damped=NULL, alpha=NULL, beta=NULL,
    gamma=NULL, phi=NULL, lambda=NULL, biasadj=FALSE,
    additive.only=FALSE, restrict=TRUE,
    allow.multiplicative.trend=FALSE)
fc<-forecast(fit1,h=12)
autoplot(fit5,pi=FALSE)
autoplot(fc)
autoplot(fit7)
autoplot(fit8)
autoplot(fit9)
autoplot(fit10)
fit11<-ets(time_series)
autoplot(fit11)
summary(fit11)
accuracy(fit11)
fit4_1<-ets(time_series,model="AAA",damped=TRUE,additive.only =TRUE)
autoplot(fit4_1)
fit5_1<-ets(time_series,model="AAA")
autoplot(fit5_1)
pred<-forecast(fit5_1)
accuracy(pred,Future_data)
ggseasonplot(time_series,year_label=TRUE,year_label_left=TRUE)
ggseasonplot(time_series,polar = TRUE)
ggsubseriesplot(time_series)
gglagplot(time_series)
autoplot(time_series)
piece_ts<-window(time_series,start=1984,end=1986
autoplot(piece_ts)
gglagplot(piece_ts)
ggAcf(time_series)
autoplot(time_series)+autolayer(meanf(time_series,h=10),PI=FALSE)+autolayer(rwf(time_series,h=10),PI=FALSE)+autolayer(rwf(time_series,drift = TRUE,h=10),PI=FALSE)+ggtitle('All forecasting method')+guides(colours=guide_legend(title = "forecast"))
res<-residuals(naive(time_series))
autoplot(res) + xlab("time") + ylab("") +ggtitle("Residuals from naïve method")
mean_t<-meanf(time_series,h=10)
naive_ts<-rwf(time_series,h=10)
drift_ts<-rwf(time_series,drift = TRUE,h=10)
accuracy(drift_ts,Future_data)
autoplot(time_series, series="Data") +autolayer(fitted(time_series), series="Fitted") +xlab("Year") + ylab("") +ggtitle("regression model")+guides(colour=guide_legend(title=" "))
ts_f<-tslm(time_series,env=baseenv())
??m3comp
?quarterly_ts_list[[703]]
