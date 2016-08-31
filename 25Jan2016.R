## Combining multiple plots using par() and layout()

# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)
par(mfrow=c(2,2)) # Create a matrix of 2x2 to accomodate 4 plots
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
detach(mtcars)

# 3 figures arranged in 3 rows and 1 column
attach(mtcars)
par(mfrow=c(3,1)) 
hist(wt)
hist(mpg)
hist(disp)


##################################################################
## Robust Regression

## http://www.ats.ucla.edu/stat/r/dae/rreg.htm\

install.packages("foreign")
install.packages("MASS")

require(foreign) # Difference between library() and require()
library(MASS)   #http://yihui.name/en/2014/07/library-vs-require/

#Reading crime data
cdata <- read.dta("http://www.ats.ucla.edu/stat/data/crime.dta")
summary(cdata)
View(cdata)

#  use poverty and single to predict crime.
ols <- lm(crime ~ poverty + single, data = cdata) #OLS - ordinary least square model
summary(ols)

?par
opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0)) #mfrow is used to combine plots, http://www.statmethods.net/advgraphs/layout.html
#png(filename = 'crimePlot.png')
plot(ols, las = 1)  #las- axis labels style-> represents the style of axis labels. (0=parallel, 1=all horizontal, 2=all perpendicular to axis, 3=all vertical)

#dev.off()

par(opar)

# the k-th q-quantile is the data value where the cumulative distribution function crosses k/q. That is, x is a k-th q-quantile for a variable X if
# 
# Pr[X < x] ??? k/q or, equivalently, Pr[X ??? x] ??? 1 ??? k/q
# and
# 
# Pr[X ??? x] ??? k/q or, equivalently, Pr[X > x] ??? 1 ??? k/q.

cdata[c(9, 25, 51), 1:2]

d1 <- cooks.distance(ols)
r <- stdres(ols)
a <- cbind(cdata, d1, r)
a[d1 > 4/51, ]
View(a[d1 > 4/51, ])


rabs <- abs(r)
a <- cbind(cdata, d1, r, rabs)
asorted <- a[order(-rabs), ]
asorted[1:10, ]

rr.huber <- rlm(crime ~ poverty + single, data = cdata)
summary(rr.huber)

hweights <- data.frame(state = cdata$state, resid = rr.huber$resid, weight = rr.huber$w)
hweights2 <- hweights[order(rr.huber$w), ]
hweights2[1:15, ]

rr.bisquare <- rlm(crime ~ poverty + single, data=cdata, psi = psi.bisquare)
summary(rr.bisquare)

biweights <- data.frame(state = cdata$state, resid = rr.bisquare$resid, weight = rr.bisquare$w)
biweights2 <- biweights[order(rr.bisquare$w), ]
biweights2[1:15, ]
