
## ---------------------------
##
## Script name: 
##
## Topic:
##
## Author: Sebastian Hanika
##
## Date Created: 2022-10-24
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

## set working directory for to current folder


# Libraries ---------------------------------------------------------------

library(tidyverse)

# load data ---------------------------------------------------------------

### Description of how to download data:
# Download data from 'webofscience.com' using the search term 'open science'
# click on 'analyze results' and then 'download data table' (All data rows)

wos.data <- read.delim(file = 'Kickstart_Course/analyze.txt')
wos.data <- head(wos.data, -1 )

# set column names
colnames(wos.data) <- c('categ', 'count', 'per')

# filter for top 25 categories by count
wos.data.filt <- head(wos.data[order(wos.data$count, decreasing = TRUE), ], 25)


# Plot data ---------------------------------------------------------------

# Ordered lollipop chart
wos.data.filt %>% 
  ggplot(aes(x = categ, y = count)) +
  geom_segment(aes(x = reorder(categ,count), xend = reorder(categ,count),
                   y = 0, yend = count), 
               color='grey') +
  geom_point(color='#516888', size=3) +
  coord_flip() + 
  labs(title = '',
       x = 'Web of Science Categories',
       y = ' Counts') +
  theme_bw() + 
  theme(panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_text(color = 'grey30'),
        text = element_text(color = 'grey30'))

# Export plot
ggsave('Kickstart_Course/plot_wos.png', width = 17, height = 12, units = 'cm')  
