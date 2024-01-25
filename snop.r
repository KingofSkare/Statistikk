# Libraries
library(readxl)
library(ggplot2)
library(readr) # For read_csv
library(dplyr) # For data manipulation, including count

# Functions
find_median <- function(df, column) {
    n <- nrow(df)
    sorted_df <- df[order(df[[column]]),]
    if (n %% 2 == 0) {
        median <- (1/2) * ( sorted_df[[column]][n / 2] + sorted_df[[column]][(n / 2) + 1])
    } else {
        median <- sorted_df[[column]][(n + 1) / 2]
    }
    return(median)
}

count_unique_values <- function(df, column_name) {
    return(df %>% count(!!sym(column_name)))
}

get_mode <- function(df, column_name) {
    value_counts <- count_unique_values(df, column_name)
    max_count <- max(value_counts$n)
    mode_values <- value_counts %>% filter(n == max_count) %>% pull(!!sym(column_name))
    return(mode_values)
}



# Data Reading
laban_path <- "/home/ingejohan/statistikk/oblig_1a/data/Laban42.csv"
laban <- read_csv(laban_path, show_col_types = FALSE)
if (is.null(laban)) stop("Data for Laban not read properly.")

brynhild_path <- "/home/ingejohan/statistikk/oblig_1a/data/Brynhild42.csv"
brynhild <- read_csv(brynhild_path, show_col_types = FALSE)
if (is.null(brynhild)) stop("Data for Brynhild not read properly.")

# Descriptive Statistics
laban_mode <- get_mode(laban, "Midpunkt")
brynhild_mode <- get_mode(brynhild, "Midpunkt")

laban_median <- median(laban$Midpunkt)
brynhild_median <- median(brynhild$Midpunkt)

laban_mean <- mean(laban$Midpunkt)
brynhild_mean <- mean(brynhild$Midpunkt)

laban_sd <- sd(laban$Midpunkt)
brynhild_sd <- sd(brynhild$Midpunkt)

laban_sd_pop <- sd(laban$Midpunkt) * sqrt((nrow(laban) - 1) / nrow(laban))
brynhild_sd_pop <- sd(brynhild$Midpunkt) * sqrt((nrow(brynhild) - 1) / nrow(brynhild))


# Plotting - Handling Multiple Modes
plot_line <- function(plot, xintercepts, color, linetype, name) {
  for(x in xintercepts) {
    plot <- plot + geom_vline(aes(xintercept = x), color = color, linetype = linetype, show.legend = name)
  }
  return(plot)
}

laban_plot <- ggplot(laban, aes(x = Midpunkt)) +
    geom_histogram(binwidth = 4.5, fill = 'skyblue') +
    labs(title = 'Frequency Diagram - Laban', x = 'Stretch before failure [mm]', y = 'Frequency')
laban_plot <- plot_line(laban_plot, laban_mode, "orange", "dashed", "Mode")
laban_plot <- laban_plot +
    geom_vline(aes(xintercept = laban_mean), color = "red", linetype = "dashed") +
    geom_vline(aes(xintercept = laban_median), color = "green", linetype = "dashed")

brynhild_plot <- ggplot(brynhild, aes(x = Midpunkt)) +
    geom_histogram(binwidth = 4.5, fill = 'salmon') +
    labs(title = 'Frequency Diagram - Brynhild', x = 'Stretch before failure [mm]', y = 'Frequency')
brynhild_plot <- plot_line(brynhild_plot, brynhild_mode, "orange", "dashed", "Mode")
brynhild_plot <- brynhild_plot +
    geom_vline(aes(xintercept = brynhild_mean), color = "red", linetype = "dashed") +
    geom_vline(aes(xintercept = brynhild_median), color = "green", linetype = "dashed")
# # Plotting
# laban_plot <- ggplot(laban, aes(x = Midpunkt)) +
#     geom_histogram(binwidth = 4.5, fill = 'skyblue') +
#     geom_vline(aes(xintercept = laban_mean), color = "red", linetype = "dashed") +
#     geom_vline(aes(xintercept = laban_median), color = "green", linetype = "dashed") +
#     geom_vline(aes(xintercept = laban_mode), color = "orange", linetype = "dashed") +
#     labs(title = 'Frequency Diagram - Laban', x = 'Stretch before failure [mm]', y = 'Frequency')

# brynhild_plot <- ggplot(brynhild, aes(x = Midpunkt)) +
#     geom_histogram(binwidth = 4.5, fill = 'salmon') +
#     geom_vline(aes(xintercept = brynhild_mean), color = "red", linetype = "dashed") +
#     geom_vline(aes(xintercept = brynhild_median), color = "green", linetype = "dashed") +
#     geom_vline(aes(xintercept = brynhild_mode), color = "orange", linetype = "dashed") +
#     labs(title = 'Frequency Diagram - Brynhild', x = 'Stretch before failure [mm]', y = 'Frequency')

# Define the relative directory where you want to save the files
directory <- "oblig_1a/figures/"

# Check if the directory exists, if not create it
if (!dir.exists(directory)) {
  dir.create(directory, recursive = TRUE)
}

# Save plots as images
ggsave(filename = "laban_freq.png", plot = laban_plot, path = directory)
ggsave(filename = "brynhild_freq.png", plot = brynhild_plot, path = directory)
