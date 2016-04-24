library(dplyr)

assemble_dataset <- function(folder){
# Get labels and create names first for easier binding later
    feat_labels <- read.table(paste0(folder, '/features.txt'))
    act_labels <- read.table(paste0(folder, '/activity_labels.txt'))
    names(act_labels) <- c('Activity_id', 'Activity')
    data_set_names <- make.names(feat_labels[,2], unique = TRUE, allow_ = TRUE)
    data_set_names <- gsub('(\\.+)$', '', data_set_names)
    data_set_names <- gsub('(\\.+)', '_', data_set_names) 
    data_set_names <- c('Subject', 'Activity_id', data_set_names)

# Vector containing filenames for our two fixed vars & dependent vars 
    dat_files <- c('subject', 'y', 'X')
    
# Loop through files, build a list of data frames & cbind them
    get_data <- function(dat_folder){
        dataset_list <- list()
        for(dat_file in dat_files){
            idx_name <- paste0(dat_file, '_', dat_folder)
            dataset_list[[idx_name]] <- read.table(
                paste0(folder, '/', dat_folder, '/', idx_name, '.txt')
                )
        }
        df <- do.call(cbind, dataset_list)
        names(df) <- data_set_names
        return(df)
    } 

# Merge training and test data sets
    data_set <- rbind(get_data('train'), get_data('test')) %>%

# Merge subject & activity labels 
    merge(act_labels, by='Activity_id', all.x=T) %>%

# Extract the mean & std deviation of measurements
    select(Subject, Activity, matches('mean|std')) %>%
    return
}

# Take tidy data frame and return mean values of all variables per activity & subject
get_means <- function(df){
   df %>%
       group_by(Subject, Activity) %>% 
           summarize_each(funs(mean)) %>%
               return
}

# Take tidy data frame and output tidy data csv
tidy_data_txt <- function(df, filename){
    write.table(df, file = paste0('./', filename, '.txt'), quote=F, row.names=F)
}

