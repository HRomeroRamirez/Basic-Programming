#Clean Environment
rm(list = ls())

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)
# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office,nrow = 3, byrow = TRUE)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)
# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
# Name the columns with region
colnames(star_wars_matrix) <- region
# Name the rows with titles
rownames(star_wars_matrix)<- titles
# Print out star_wars_matrix
star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE,
                           dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"), 
                                           c("US", "non-US")))
# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector <- rowSums(star_wars_matrix)
# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)  

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2] 
# Average non-US revenue
mean(non_us_all) 
# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2,2] 
# Average non-US revenue for first two movies
mean(non_us_some)
# Estimate the visitors
visitors <- all_wars_matrix/5 
# Print the estimate to the console
visitors



