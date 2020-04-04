def comparison
  # Add start_time and end_time instance variable. because it does'nt exist
  @start_time = Time.now
  @end_time = Time.now + 100_000

  # Removed BB in total_summary because i think it's useless when i want to get-
  # the total summary of my order
  @summary = Order.active.approved.totals_summary(@start_time, @end_time)

  @summary_compare = Order.active
                          .approved
                          .totals_summary(@start_time - 1.year,
                                          @end_time - 1.year)

  # create instance variable for summary compare total that hold the condition
  # because this condition was redundant on if and else block
  @summary_compare_total = (@summary_compare.total.to_f.zero? ? 1 : @summary_compare.total)

  if @summary_compare.total.to_f < @summary.total.to_f
    @change = @summary.total.to_f - @summary_compare.total.to_f
    @summary_pct_change = "#{((@change / @summary_compare_total.to_f) * 100).round}% Higher"
  else
    @change = @summary_compare.total.to_f - @summary.total.to_f
    @summary_pct_change = "#{((@change / @summary_compare_total.to_f) * 100).round}% Lower"
  end
end
