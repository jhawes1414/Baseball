#install.packages("rvest")
##library(rvest)


fg_wbpg <- read_html("https://blogs.fangraphs.com/top-33-prospects-boston-red-sox/")




P_name <- fg_wbpg %>%
  html_nodes(".align-L") %>%
  html_text() 

P_name


P_age <- fg_wbpg %>%
  html_nodes(".align-L+ td") %>%
  html_text() 

P_age

P_pos<- fg_wbpg %>%
  html_nodes(".sortable td:nth-child(5)") %>%
  html_text()


P_pos

P_role<- fg_wbpg %>%
  html_nodes(".sortable td:nth-child(7)") %>%
  html_text()

P_role

P_report <-fg_wbpg %>%
  html_nodes("#tool-caps-prospects-list p:nth-child(1)") %>%
  html_text()

P_rk<- fg_wbpg%>%
  html_nodes(".sortable td:nth-child(1)") %>%
  html_text()

P_lvl<- fg_wbpg%>%
  html_nodes(".sortable td:nth-child(4)") %>%
  html_text()




BOS<- data.frame(Name=P_name,Rk=P_rk, Age=P_age,ORG="BOS", Highest_LVL=P_lvl, POS=P_pos, FV=P_role, Report= P_report)






