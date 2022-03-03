#install.packages("languageserver")
#install.packages("magick")
#install.packages("rsvg")


library(magick)
library(rsvg)

#tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
#plot(tiger)

#install.packages("imager")

library(imager)

fimg <- system.file("Images/tecnm.png", package = 'imager')
im <- load.image(fimg)
plot(im)
