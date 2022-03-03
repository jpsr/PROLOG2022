#install.packages("languageserver")
#install.packages("magick")
#install.packages("rsvg")


library(magick)
library(rsvg)

#tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
#plot(tiger)

fimage <- image_read("Images/tecnm.png")
print(fimage)


