

url3 <- "https://ejpr.onlinelibrary.wiley.com/doi/10.1111/1475-6765.12054"
download.file(url3, destfile = "technocracy_in_europe.html")

tech_table <- read_html(url3) %>% 
  html_node( xpath = "/html/body/div[2]/div/div[2]/main/div[1]/div/section[2]/div/div/div/div/article/div/div[1]/div[5]/article/section[2]/section[3]/div[2]/div[1]/table") %>% 
  html_table()
tech_table

tech_table2 <- read_html(url3) %>% 
  html_node( xpath = "/html/body/div[2]/div/div[2]/main/div[1]/div/section[2]/div/div/div/div/article/div/div[1]/div[5]/article/section[2]/section[5]/div/div[1]/table") %>% 
  html_table()
tech_table2

tech_table3 <- read_html(url3) %>% 
  html_node( xpath = "/html/body/div[2]/div/div[2]/main/div[1]/div/section[2]/div/div/div/div/article/div/div[1]/div[5]/article/section[2]/section[6]/div[2]/div[1]/table") %>% 
  html_table()
tech_table3

tech_tabl4 <- read_html(url3) %>%
  html_node( xpath = "/html/body/div[2]/div/div[2]/main/div[1]/div/section[2]/div/div/div/div/article/div/div[1]/div[5]/article/section[2]/section[7]/div/div[1]/table") %>%
  html_table()
tech_tabl4

tech_table <- subset(tech_table, select = -c(No.))
tech_table3 <- subset(tech_table3, select = -c(No.))

techn <- merge(tech_table, tech_table3, by = "Prime minister")

techn <- subset(techn, `Member State.x` != "Total")

rm(tech_table, tech_table3)
