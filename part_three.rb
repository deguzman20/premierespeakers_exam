def comparison
  @summary = Order.active.approved.totals_summary(@start_time, @end_time, "BB")
  @summary_compare = Order.active.approved.totals_summary(@start_time - 1.year, @end_time - 1.year, "BB")

  if @summary_compare.total.to_f < @summary.total.to_f
      @change = @summary.total.to_f - @summary_compare.total.to_f
      @summary_pct_change = "#{((@change / (@summary_compare.total.to_f.zero? ? 1 : @summary_compare.total).to_f) * 100).round}% Higher"
  else
      @change = @summary_compare.total.to_f - @summary.total.to_f
      @summary_pct_change = "#{((@change / (@summary_compare.total.to_f.zero? ? 1 : @summary_compare.total).to_f) * 100).round}% Lower"
  end
end