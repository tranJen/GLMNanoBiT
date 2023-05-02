#install.packages("ggplot2")
library(ggplot2)
library(tidyverse)
library(readr)

total_spec <- read_csv("https://raw.githubusercontent.com/tranJen/GLMNanoBiT_Honors_Thesis/main/total%20spectrum/totspec_normalizedAver.csv")

totGroup <- total_spec %>% pivot_longer(cols = starts_with("NanoBiT"), names_to = "Sample", values_to = "RLU")

spectra <- ggplot(totGroup, aes(x = Wavelength, y = RLU, colour = Sample)) +
  geom_line(lwd = 1.25) +
  scale_color_manual(values= c("cornflowerblue","cyan3","darkseagreen","darkgoldenrod1")) +
  ylab("Normalized RLU") +
  xlab("Wavelength (nm)") + xlim(350, 600)+
  theme_classic() +
  theme(text = element_text(size = 20)) +
  geom_text(aes(x = 440, y = 1.05, label = "450 nm"), size = 5, col = "cornflowerblue", fontface = 'bold') +
  geom_text(aes(x = 490, y = 1.05, label = "490 nm"), size = 5, col = "cyan3", fontface = 'bold') +
  geom_text(aes(x = 540, y = 1.05, label = "520 nm"), size = 5, col = "darkseagreen", fontface = 'bold') +
  geom_text(aes(x = 590, y = 1.05, label = "580 nm"), size = 5, col = "darkgoldenrod1", fontface = 'bold')

#save data 
ggsave("spectra.png", spectra, width = 8, height = 6, units = "in")