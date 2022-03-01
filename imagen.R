#install.packages("magick")
#install.packages("rsvg")

library(magick)
library(rsvg)

#tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
#plot(tiger)
#print(tiger)


frink <- image_read("https://jeroen.github.io/images/frink.png")
plot(frink)