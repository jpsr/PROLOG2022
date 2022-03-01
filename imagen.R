#install.packages("languageserver")
#install.packages("magick")
#install.packages("rsvg")


library(magick)
library(rsvg)

#tiger <- image_read_svg('http://jeroen.github.io/images/tiger.svg', width = 350)
#plot(tiger)
#print(tiger)


im <- image_read("https://github.com/jpsr/PROLOG2022/blob/37f3859c8d8c8b22598cd4520032e32e7e9ba88b/img.jpg")
