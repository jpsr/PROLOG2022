
#install.packages("magick")
#install.packages("rsvg")


library(magick)
library(rsvg)

#tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
#plot(tiger)

tec <- image_read("Images/tecnm.png")
#plot(tec)

fondo <- image_border(image_background(tec,'#6991ff'),"#298000","60x60")

rotacion <- image_rotate(fondo,45)
plot(rotacion)
