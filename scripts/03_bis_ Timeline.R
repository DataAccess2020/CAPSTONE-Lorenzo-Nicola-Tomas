#TIMELINE

outcomes_levels <- c("First Gov", "Majority Confirmed", "Majority Changed", "Constitutional Referendum", "Early Election", "End Legislature", "Technocratic Gov.")
outcomes_colors <- c("#0070C0", "#00ff00", "#C00000", "#FFC000", "#708090", "#ff7f50", "#000000")

italy$outcomes <- factor(italy$outcomes, levels=outcomes_levels, ordered=TRUE)

positions <- c(0.5, -0.5, 1.0, -1.0, 1.5, -1.5)
directions <- c(1, -1)

line_pos <- data.frame(
  "start_date"=unique(italy$start_date),
  "position"=rep(positions, length.out=length(unique(italy$start_date))),
  "direction"=rep(directions, length.out=length(unique(italy$start_date)))
)

ita <- merge(x=italy, y=line_pos, by= "start_date", all = TRUE)
ita <- ita[with(ita, order(start_date, outcomes)), ]

head(ita)



text_offset <- 0.05

ita$year_count <- ave(ita$start_date==ita$start_date, ita$start_date, FUN=cumsum)
ita$text_position <- (ita$year_count * text_offset * ita$direction) + ita$position
head(ita)

year_buffer <- 1

year_date_range <- seq(min(ita$start_date) - years(year_buffer), max(ita$start_date) + years(year_buffer), by='year')
year_format <- format(year_date_range, '%y')
year_df <- data.frame(year_date_range, year_format)

#PLOT

timeline_plot<-ggplot(ita,aes(x=start_date,y=0, col=outcomes, label= cabinet_name))
timeline_plot<-timeline_plot+labs(col="outcomes")
timeline_plot<-timeline_plot+scale_color_manual(values=outcomes_colors, labels=outcomes_levels, drop = FALSE)
timeline_plot<-timeline_plot+theme_classic()

# Plot horizontal black line for timeline
timeline_plot<-timeline_plot+geom_hline(yintercept=0, 
                                        color = "black", size=0.3)

# Plot vertical segment lines for milestones
timeline_plot<-timeline_plot+geom_segment(data=ita[ita$year_count == 1,], aes(y=position,yend=0,xend=start_date), color='black', size=0.2)

# Plot scatter points at zero and date
timeline_plot<-timeline_plot+geom_point(aes(y=0), size=3)

# Don't show axes, appropriately position legend
timeline_plot<-timeline_plot+theme(axis.line.y=element_blank(),
                                   axis.text.y=element_blank(),
                                   axis.title.x=element_blank(),
                                   axis.title.y=element_blank(),
                                   axis.ticks.y=element_blank(),
                                   axis.text.x =element_blank(),
                                   axis.ticks.x =element_blank(),
                                   axis.line.x =element_blank(),
                                   legend.position = "bottom"
)

# Show text for each year
timeline_plot<-timeline_plot+geom_text(data=year_df, aes(x=year_date_range,y=-0.1,label=year_format),size=2.5,vjust=0.5, color='black', angle=90)

# Show text for each cabinet
timeline_plot<-timeline_plot+geom_text(aes(y=text_position,label=cabinet_name),size=2.5)
#print plot

ggplotly(timeline_plot)


